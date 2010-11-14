class Post < ActiveRecord::Base
  belongs_to :member

  default_scope :order => "created_at DESC"

  validates_presence_of :title, :body
end
