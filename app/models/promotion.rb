class Promotion < ActiveRecord::Base
  belongs_to :member
  belongs_to :hierarchy

  validates_presence_of :member_id
  validates_presence_of :hierarchy_id

  named_scope :ordered, :order => 'time DESC'

  def current
    ordered.first
  end

  # virtual attributes
  def date
    Date.civil(time.year, time.month, time.day)
  end

  def date=(date)
    self.time.year = date.year
    self.time.month = date.month
    self.time.day = date.day
  end

  def clock
  end

  def clock=(clock)
  end

end
