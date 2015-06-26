class Beer < ActiveRecord::Base
  has_many :statuses
  has_many :establishments, through: :statuses
end