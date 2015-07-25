json.array! @reviews do |review|
  json.id review.id
  json.shop_id review.shop_id
  json.user_id review.user_id
  json.title review.title
  json.body review.body
  json.username review.user.fname
  json.lname review.user.lname
  json.created_at review.created_at
  json.updated_at review.updated_at
end
