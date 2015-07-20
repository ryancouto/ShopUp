class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :shop_id, null: false
      t.integer :user_id, null: false
      t.string :title
      t.text :body, null: false

      t.timestamps null: false
    end
    add_index :reviews, :shop_id
    add_index :reviews, :user_id
  end

end
