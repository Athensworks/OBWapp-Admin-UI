class Establishment < ActiveRecord::Base
  has_many :statuses, dependent: :destroy
  has_many :beers, through: :statuses

  default_scope -> { order(:name) }

  geocoded_by :address, latitude: :lat, longitude: :lon

  after_validation :geocode
end