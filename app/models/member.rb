class Member < ActiveRecord::Base
  acts_as_tree :foreign_key => :godfather_id
  belongs_to :entity, :dependent => :destroy
  has_many :posts
  has_many :availabilities
  has_many :promotions
  has_many :last_promotions
  has_one :user
  has_one :programme
  has_one :role

  after_create :initial_promotion

  accepts_nested_attributes_for :entity
  accepts_nested_attributes_for :user

  validates_presence_of :nickname, :student_number
  validates_length_of :student_number, :maximum => 9
  validates_uniqueness_of :student_number
  validates_uniqueness_of :nbi, :allow_nil => true

  validate :validate_format_of_nbi

  named_scope :ordered, :include => :last_promotions,
    :order => 'last_promotions.time ASC'

  # Alias for acts_as_tree's parent
  def godfather
    parent
  end

  # Initial promotion to the lowest hierarchy
  def initial_promotion
    p = Promotion.new
    p.hierarchy = Hierarchy.last
    p.member = self

    # FIXME: This will have to do by now
    p.time = Time.now
    p.save
  end

  # Gets the current member's hierarchy
  def hierarchy
    promotions.ordered.first.hierarchy
  end

  private
  def validate_format_of_nbi
    true # TODO: actually do some validation
  end

end
