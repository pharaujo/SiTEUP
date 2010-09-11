class Promotion < ActiveRecord::Base
  attr_accessible :time, :order, :name, :member, :hierarchy

  belongs_to :member
  belongs_to :hierarchy
end
