class Telephone < ActiveRecord::Base
  belongs_to :entity

  validates_presence_of :telephone
end
