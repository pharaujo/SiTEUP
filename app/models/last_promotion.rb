class LastPromotion < ActiveRecord::Base
  # THIS IS A DATABASE VIEW
  # DON'T YOU FUCKIN' MOVE!

  belongs_to :member
  belongs_to :hierarchy
end
