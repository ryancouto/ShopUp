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
########
20.times do
	Shop.create(
	owner_id: [5,10,15,20,25,30,35,40,45,50].sample,
	address: (100..1800).to_a.sample.to_s + ', ' + ['Broadway Ave', 'Amsterdam Ave', 'Park Ave', 'Madison Ave'].sample,
	city: "New York",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

20.times do
	Shop.create(
	owner_id: [5,10,15,20,25,30,35,40,45,50].sample,
	address: (100..1800).to_a.sample.to_s + ', ' + ['Broadway', 'Atlantic Ave', 'Bushwick Ave'].sample,
	city: "Brooklyn",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

20.times do
	Shop.create(
	owner_id: [5,10,15,20,25,30,35,40,45,50].sample,
	address: (100..350).to_a.sample.to_s + ', ' + ['A3', 'A4', 'A5', 'A6'].sample,
	city: "London",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end
#################
20.times do
	Shop.create(
	owner_id: [4,9,14,19,24,29,34,39,44,49].sample,
	address: (100..2000).to_a.sample.to_s + ', ' + ['Powell St', 'Geary Blvd', 'Market St'],
	city: "San Francisco",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

20.times do
	Shop.create(
	owner_id: [4,9,14,19,24,29,34,39,44,49].sample,
	address: (800..4000).to_a.sample.to_s + ', ' + ['International Blvd', 'MacArthur Blvd', 'Broadway'],
	city: "Oakland",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

20.times do
	Shop.create(
	owner_id: [4,9,14,19,24,29,34,39,44,49].sample,
	address: (10000..30000).to_a.sample.to_s + ', ' + ['Ventura Blvd', 'Sepulveda Blvd', 'Mulholland Dr'],
	city: 'Los Angeles',
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

################

# 20.times do
# 	Shop.create(
# 	owner_id: [3,8,13,18,23,28,33,38,43,48].sample,
# 	address:
# 	city: "Paris",
# 	description: Faker::Lorem.paragraph(6),
# 	price: Faker::Number.number(3),
# 	size: Faker::Number.number(4),
# 	)
# end
#
# #############
#
# 20.times do
# 	Shop.create(
# 	owner_id: [2,7,12,17,22,27,32,37,42,47].sample
# 	address:
# 	city: "Amsterdam"
# 	)
# end
#
# ##############
#
# 20.times do
# 	Shop.create(
# 	owner_id: [1,6,11,16,21,26,31,36,41,46].sample
# 	address:
# 	city: "Rome"
# 	)
# end

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
