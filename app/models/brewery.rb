class Brewery < ActiveRecord::Base
  has_many :beers

  geocoded_by :address, latitude: :lat, longitude: :lon

  default_scope -> { order(:name) }

  after_validation :geocode
end
