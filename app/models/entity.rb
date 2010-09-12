class Entity < ActiveRecord::Base
  belongs_to :entity_type
  has_many :telephones, :dependent => :destroy
  has_many :emails, :dependent => :destroy
  has_many :addresses, :dependent => :destroy
  # belongs_to :telephone, :foreign_key => :main_telephone
  # belongs_to :email, :foreign_key => :main_email
  # belongs_to :address, :foreign_key => :main_address

  accepts_nested_attributes_for :telephones, 
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } },
    :allow_destroy => true

  accepts_nested_attributes_for :emails,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } },
    :allow_destroy => true

  accepts_nested_attributes_for :addresses,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } },
    :allow_destroy => true

  validates_presence_of :name, :entity_type
  validates_numericality_of :nif, :only_integer => true, :greater_than => 0, :allow_nil => true
  validates_format_of :homepage, :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/
  validates_uniqueness_of :nif, :allow_nil => true

  validate :validates_format_of_nif

  # Override the 'all' method so it returns only entities, not members
  # TODO: improve the condition so it can be more general
  #
  def self.all
    super(:joins => :entity_type, :conditions => 
      ["entity_types.description <> ? AND entity_types.description <> ?",
        "Membro", "Member"])
  end

  # TODO: translate the error messages below
  #
  private
  def validates_format_of_nif
    return if nif.nil?

    nif_tmp = nif.to_s.scan(/\d/).map {|i| i.to_i}
    unless nif_tmp.length == 9
      errors.add(:nif, "is invalid")
      return
    end

    unless (([nif_tmp[0]] & [1, 2, 5, 6, 8, 9]).empty?)
      check_digit = 0
      (0..7).each { |i| check_digit += nif_tmp[i] * (9 - i) }
      check_digit = check_digit % 11 ? (11 - check_digit % 11) % 10 : 0;
      return if check_digit == nif_tmp[8]
    end

    errors.add(:nif, "is invalid")
  end
end
