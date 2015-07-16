class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :owner_id, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.text :description
      t.integer :price, null: false
      t.integer :size, null: false

      t.timestamps null: false
    end
    add_index :shops, :owner_id
    add_index :shops, :city
    add_index :shops, :price
    add_index :shops, :size
  end
end
