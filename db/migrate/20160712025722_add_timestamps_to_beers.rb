class AddTimestampsToBeers < ActiveRecord::Migration
  def change
    change_table :beers do |t|
      t.timestamps
    end
  end
end
