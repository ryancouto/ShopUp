class AddImageDetailToShops < ActiveRecord::Migration
  def change
    add_column :shops, :image_file_name, :string
    add_column :shops, :image_content_type, :string
    add_column :shops, :image_file_size, :integer
    add_column :shops, :image_updated_at, :datetime
  end
end
