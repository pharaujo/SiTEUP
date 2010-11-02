class Post < ActiveRecord::Base
  belongs_to :member

  default_scope :order => "created_at"
end
