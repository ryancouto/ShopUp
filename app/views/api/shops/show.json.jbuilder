json.extract! @shop, :id, :owner_id, :address, :city, :description, :price, :size, :created_at, :updated_at, :reservations

@shop.reservations.each do |reservation|
  json.id reservation.id
  json.owner_id reservation.owner_id
  json.renter_id reservation.renter_id
  json.shop_id reservation.shop_id
  json.start_day reservation.start_day
  json.end_day reservation.end_day
  json.approved reservation.approved
end
