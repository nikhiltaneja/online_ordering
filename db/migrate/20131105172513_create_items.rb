class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :quantity
      t.string :image_url

      t.references :category, index: true

      t.timestamps
    end
  end
end
