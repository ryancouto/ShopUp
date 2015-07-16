# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
	User.create(
	email: Faker::Internet.email,
	fname: Faker::Name.name.split(' ')[0],
	lname: Faker::Name.name.split(' ')[1],
	password: "password"
	)
end

100.times do
	Shop.create(
	owner_id: 1,
	address: Faker::Address.street_address,
	city: Faker::Address.city,
	description: Faker::Company.catch_phrase,
	price: Faker::Number.number(4),
	size: Faker::Number.number(5)
	)
end

user = User.find(1)


300.times do
	Reservation.create(
	approved: false,
	owner_id: 1,
	renter_id: Faker::Number.between(2, 50),
	shop_id: user.shops.sample.id,
	start_day: Date.new(Faker::Number.between(2015, 2016), Faker::Number.between(1,12), Faker::Number.between(1,20)),
	end_day: Date.new(Faker::Number.between(2017, 2018), Faker::Number.between(1,12), Faker::Number.between(1,20)),
	)
end
