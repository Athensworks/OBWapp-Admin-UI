class FutureData < ActiveRecord::Base
  self.table_name = 'futuredata'

  def self.log(parameters)
  	FutureData.create(parameters.permit(:beer_id, :device_guid, :age, :lat, :lon, :like_type))
  end
end