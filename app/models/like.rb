class Like < ActiveRecord::Base
  LIKE_VALUE = 1
  FAVORITE_VALUE = 2
  
  scope :liked,     -> { where(like_type: LIKE_VALUE) }
  scope :favorited, -> { where(like_type: FAVORITE_VALUE) }
end