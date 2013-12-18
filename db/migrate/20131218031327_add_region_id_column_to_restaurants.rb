class AddRegionIdColumnToRestaurants < ActiveRecord::Migration
  def change
    add_reference :restaurants, :region, index: true
  end
end
