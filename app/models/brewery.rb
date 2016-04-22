class Brewery < ActiveRecord::Base
  has_many :beers

  geocoded_by :address, latitude: :lat, longitude: :lon

  after_validation :geocode
end
