class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :entity

  has_many :availabilities
end
