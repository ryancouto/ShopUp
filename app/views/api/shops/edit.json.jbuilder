json.extract! @shop, :id, :owner_id, :address, :city, :description, :price, :size, :created_at, :updated_at
json.image_url asset_path(shop.image.url(:original))
