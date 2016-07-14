class Rating < ActiveRecord::Base
  belongs_to :beer

  scope :for_beer, ->(beer_id) { where(beer_id: beer_id).average(:value).to_f || 0 }
end
