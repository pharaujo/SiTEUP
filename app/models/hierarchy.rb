class Hierarchy < ActiveRecord::Base
  attr_accessible :description

  has_many :promotions
  has_many :last_promotions
  has_many :members, :through => :last_promotions

  default_scope :order => 'position ASC'

  def ordered_members
    members.all(:order => "last_promotions.time DESC")
  end

end
