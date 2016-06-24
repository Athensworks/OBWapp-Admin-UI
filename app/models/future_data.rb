class FutureData < ActiveRecord::Base
  self.table_name = 'futuredata'

  def self.log(parameters)
  	FutureData.create(parameters)
  end
end