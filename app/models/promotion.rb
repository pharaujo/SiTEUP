class Promotion < ActiveRecord::Base
  belongs_to :member
  belongs_to :hierarchy

  validates_presence_of :member_id
  validates_presence_of :hierarchy_id

  named_scope :ordered, :order => 'time DESC'

  def current
    ordered.first
  end
end
