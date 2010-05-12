class Email < ActiveRecord::Base
  belongs_to :entity

  # TODO: check the following regex.
  # Taken from: http://api.rubyonrails.org/classes/ActiveRecord/Validations/ClassMethods.html
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
