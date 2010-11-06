class Member < ActiveRecord::Base
  acts_as_tree :foreign_key => :godfather_id
  belongs_to :entity, :dependent => :destroy

  has_many :posts
  has_many :availabilities
  has_many :promotions
  has_many :roles

  has_one :last_promotion
  has_one :user
  has_one :programme

  after_create :initial_promotion

  accepts_nested_attributes_for :entity
  accepts_nested_attributes_for :user

  validates_presence_of :nickname, :student_number
  validates_length_of :student_number, :maximum => 9
  validates_uniqueness_of :student_number
  validates_uniqueness_of :nbi, :allow_nil => true

  validate :validate_format_of_nbi

  named_scope :active, :conditions => {:active => true}
  named_scope :ordered, :include => :last_promotion, :order => 'last_promotions.time ASC'
  named_scope :with_role, lambda { |role| {:conditions => "roles.name = '#{role}' AND roles.end_date IS NULL", :include => :roles} }

  # Alias for acts_as_tree's parent
  def godfather
    parent
  end

  # Initial promotion to the lowest hierarchy
  def initial_promotion
    p = Promotion.new
    p.hierarchy = Hierarchy.last
    p.member = self

    # FIXME: This will have to make do by now
    p.time = Time.now
    p.save
  end

  # Gets the current member's hierarchy
  def hierarchy
    promotions.ordered.first.hierarchy
  end

  # Checks if member is or not available for a certain event
  def available?(event)
    availability(event) ? availability(event).go : false
  end

  # Returns member's availability for a certain event
  def availability(event)
    availabilities.first(event)
  end

  # combines into an array the organization roles
  def roles_array
    roles.map {|r| r.name}
  end

  private
  def validate_format_of_nbi
    true # TODO: actually do some validation
  end

end
