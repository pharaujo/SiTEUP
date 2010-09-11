class Hierarchy < ActiveRecord::Base
  attr_accessible :description
  has_many :promotions
end
