class AddStatusAndDisplayToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :status, :string, default: "pending"
    add_column :restaurants, :display, :boolean, default: false
  end
end
