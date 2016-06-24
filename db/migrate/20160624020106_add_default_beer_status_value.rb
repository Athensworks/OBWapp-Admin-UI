class AddDefaultBeerStatusValue < ActiveRecord::Migration
  def change
  	change_column_default :statuses, :reported_out_count, 0
  end
end
