class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :level
      t.references :restaurant, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
