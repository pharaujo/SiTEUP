class Hierarchy < ActiveRecord::Base
  attr_accessible :description
  has_many :promotions
  has_many :members, :through => :promotions
end
