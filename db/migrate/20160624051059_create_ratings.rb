class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :beer_id
      t.string :device_guid
      t.integer :value

      t.timestamps null: false
    end
  end
end
