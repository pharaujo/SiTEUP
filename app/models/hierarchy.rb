class Hierarchy < ActiveRecord::Base
  attr_accessible :description

  has_many :promotions
  has_many :last_promotions
  has_many :members, :through => :last_promotions

  # This is pretty implicit
  def all
    super.all(:order => "position DESC")
  end

  # Oh wow. This is the worst shaite I've ever been into.
  def ordered_members
    members.all(:order => "last_promotions.time DESC")
  end

end
