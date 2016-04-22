class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.text :description
      t.string :addresses
      t.float :lat
      t.float :lon

      t.timestamps null: false
    end
  end
end
