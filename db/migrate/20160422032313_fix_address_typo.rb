class FixAddressTypo < ActiveRecord::Migration
  def change
    rename_column :breweries, :addresses, :address
  end
end
