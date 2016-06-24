class Like < ActiveRecord::Base
  TASTE_VALUE = 1
  FAVORITE_VALUE = 2

  belongs_to :beer

  scope :tasted,     -> { where(like_type: TASTE_VALUE) }
  scope :favorited, -> { where(like_type: FAVORITE_VALUE) }
end