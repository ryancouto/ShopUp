json.extract! @user, :id, :email, :fname, :lname, :created_at, :updated_at, :shops, :reviews
json.pending_reservations @user.pending_reservations do |res|
  json.id res.id
  json.shop_id res.shop_id
  json.start_day res.start_day
  json.end_day res.end_day
  json.approved res.approved
  json.shop_address res.shop.address
  json.shop_city res.shop.city
  json.renter_name res.renter.fname + ' ' + res.renter.lname
end
json.requested_reservations @user.requested_reservations do |res|
  json.id res.id
  json.shop_id res.shop_id
  json.start_day res.start_day
  json.end_day res.end_day
  json.approved res.approved
  json.shop_address res.shop.address
  json.shop_city res.shop.city
end
