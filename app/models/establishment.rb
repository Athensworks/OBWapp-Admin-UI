class Establishment < ActiveRecord::Base
  has_many :statuses
  has_many :beers, through: :statuses
end