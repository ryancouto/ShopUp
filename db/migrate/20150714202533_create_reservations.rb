class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :owner_id, null: false
      t.integer :renter_id, null: false
      t.integer :shop_id, null: false
      t.date :start_day, null: false
      t.date :end_day, null: false
      t.boolean :approved?, default: false, null: false

      t.timestamps null: false
    end

    add_index :reservations, :owner_id
    add_index :reservations, :renter_id
    add_index :reservations, :shop_id

  end
end
