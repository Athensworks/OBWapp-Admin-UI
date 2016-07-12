class AddUntappdUrlToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :untappd_url, :string
  end
end
