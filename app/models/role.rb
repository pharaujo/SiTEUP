class Role < ActiveRecord::Base
  belongs_to :member
  belongs_to :role_type

  default_scope :conditions => ["end_date is NULL AND start_date < ?", Time.now]

  NAMES = %w[magister ensaiador]

  validates_presence_of :name, :start_date

  after_create :end_other_mandates

  def end_other_mandates
    old_role = Role.first(:conditions => ["id <> ? AND name = ? AND end_date is NULL", id, name])
    return if old_role.nil?

    old_role.end_date = start_date
    old_role.save
  end
end
