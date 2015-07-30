json.array! @search_results do |shop|
  json.id shop.id
  json.owner_id shop.owner_id
  json.address shop.address
  json.city shop.city
  json.description shop.description
  json.price shop.price
  json.size shop.size
  json.latitude shop.latitude
  json.longitude shop.longitude
  json.image_url asset_path(shop.image.url(:original))
end
