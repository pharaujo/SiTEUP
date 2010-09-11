class Role < ActiveRecord::Base
  attr_accessible :name, :description, :start_date, :end_date, :member, :role_type
end
