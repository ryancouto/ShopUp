json.array! @search_results do |shop|
  # json.owner_id shop.owner_id
  json.address shop.address
  json.city shop.city
  # json.description shop.description
  # json.price shop.price
  # json.size shop.size
  # json.latitude shop.latitude
  # json.longitude shop.longitude
  # json.created_at shop.created_at
  # json.updated_at shop.updated_at
  # json.reservations shop.reservations do |res|
  #   json.renter_id res.renter_id
  #   json.start_day res.start_day
  #   json.end_day res.end_day
  #   json.approved res.approved
  # end
  # json.reviews shop.reviews do |rev|
  #   json.username rev.user.fname
  #   json.title rev.title
  #   json.body rev.body
  #   json.created_at rev.created_at
  # end
  # json.image_url asset_path(shop.image.url(:original))
end
