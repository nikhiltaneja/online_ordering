class AddDefaultOrderStatus < ActiveRecord::Migration
  def change
    change_column :orders, :status, :text, :default => "incomplete"
  end
end
