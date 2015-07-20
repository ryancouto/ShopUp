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

30.times do
	Shop.create(
	owner_id: 1,
	address: (100..3000).to_a.sample.to_s + ' Broadway Ave',
	city: "New York City",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

30.times do
	Shop.create(
	owner_id: 2,
	address: (100..2000).to_a.sample.to_s + ' Powell St',
	city: "San Francisco",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

user1 = User.find(1)
user2 = User.find(2)

150.times do
	Reservation.create(
	approved: false,
	owner_id: 1,
	renter_id: Faker::Number.between(2, 50),
	shop_id: user1.shops.sample.id,
	start_day: Date.new(Faker::Number.between(2015, 2016), Faker::Number.between(1,12), Faker::Number.between(1,20)),
	end_day: Date.new(Faker::Number.between(2017, 2018), Faker::Number.between(1,12), Faker::Number.between(1,20)),
	)
end

150.times do
	Reservation.create(
	approved: false,
	owner_id: 2,
	renter_id: Faker::Number.between(3, 50),
	shop_id: user2.shops.sample.id,
	start_day: Date.new(Faker::Number.between(2015, 2016), Faker::Number.between(1,12), Faker::Number.between(1,20)),
	end_day: Date.new(Faker::Number.between(2017, 2018), Faker::Number.between(1,12), Faker::Number.between(1,20)),
	)
end

300.times do
	Review.create(
	shop_id: (1..60).to_a.sample,
	user_id: (1..50).to_a.sample,
	title: Faker::Hacker.adjective,
	body: Faker::Hacker.say_something_smart
	)
end
