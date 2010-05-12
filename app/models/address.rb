class Address < ActiveRecord::Base
  belongs_to :entity
  
  validates_length_of :zipcode, :maximum => 8
end
