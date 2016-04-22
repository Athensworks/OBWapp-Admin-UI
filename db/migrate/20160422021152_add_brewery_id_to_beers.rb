class AddBreweryIdToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :brewery_id, :integer

    # And other cleanup
    remove_column :beers, :brewery
    remove_column :beers, :rate_beer_id
  end
end
