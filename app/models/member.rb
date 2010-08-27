class Member < ActiveRecord::Base
  # acts_as_tree :foreign_key => :godfather_id
  belongs_to :entity, :dependent => :destroy
  has_many :posts
  has_one :user
  has_one :programme

  accepts_nested_attributes_for :entity
  accepts_nested_attributes_for :user

  validates_presence_of :nickname
  validates_length_of :student_number, :maximum => 9
  validates_uniqueness_of :nbi, :allow_nil => true

  validate :validate_format_of_nbi

  private
  def validate_format_of_nbi
    true # TODO: actually do some validation
  end

end
