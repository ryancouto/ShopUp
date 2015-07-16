json.extract! @user, :id, :email, :fname, :lname, :created_at, :updated_at

@user.shops.each do |shop|
  json.id           shop.id
  json.address      shop.address
  json.city         shop.city
  json.description  shop.description
  json.price        shop.price
  json.size         shop.size
  json.updated_at   shop.updated_at
  json.created_at   shop.created_at
end
