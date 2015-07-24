# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
	email: 'guest@gmail.com',
	fname: 'Guest',
	lname: 'User',
	password: 'password'
)

50.times do
	User.create(
	email: Faker::Internet.email,
	fname: Faker::Name.name.split(' ')[0],
	lname: Faker::Name.name.split(' ')[1],
	password: "password"
	)
end
########
30.times do
	Shop.create(
	owner_id: (1..51).to_a.sample,
	address: (100..1800).to_a.sample.to_s + ' ' + ['Broadway Avenue', 'Amsterdam Avenue', 'Park Avenue', 'Madison Avenue'].sample,
	city: "New York",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

30.times do
	Shop.create(
	owner_id: (1..51).to_a.sample,
	address: (100..1800).to_a.sample.to_s + ' ' + ['Broadway', 'Atlantic Avenue', 'Bushwick Avenue', 'Bedford Avenue', 'Manhattan Avenue'].sample,
	city: "Brooklyn",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

30.times do
	Shop.create(
	owner_id: (1..51).to_a.sample,
	address: (100..350).to_a.sample.to_s + ' ' + ['Oxford Street', 'Regent Street', 'Carnaby Street', "King's Road", 'Kensington', 'Camden Town'].sample,
	city: "London",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end
#################
30.times do
	shop = Shop.new(
	owner_id: (1..51).to_a.sample,
	address: (100..2000).to_a.sample.to_s + ' ' + ['Powell Street', 'Geary Boulevard', 'Market Street', 'Fillmore Street', 'Mission Boulevard', 'Haight Street', 'Ashbury Street', 'Divisadero Street'].sample,
	city: "San Francisco",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
	img = ["#{Rails.root}/app/assets/images/1.jpg", "#{Rails.root}/app/assets/images/2.jpg", "#{Rails.root}/app/assets/images/3.jpg",
				"#{Rails.root}/app/assets/images/4.jpg", "#{Rails.root}/app/assets/images/5.jpg", "#{Rails.root}/app/assets/images/6.jpg",
				"#{Rails.root}/app/assets/images/9.jpg", "#{Rails.root}/app/assets/images/8.jpg", "#{Rails.root}/app/assets/images/7.jpg"].sample
	shop.image = File.open(img)
	shop.save!
end

shop = Shop.new(
		owner_id: 1
		address: (100..2000).to_a.sample.to_s + ' ' + ['Powell Street', 'Geary Boulevard', 'Market Street', 'Fillmore Street', 'Mission Boulevard', 'Haight Street', 'Ashbury Street', 'Divisadero Street'].sample,
		city: "San Francisco",
		description: Faker::Lorem.paragraph(6),
		price: Faker::Number.number(3),
		size: Faker::Number.number(4)
		)
	img = ["#{Rails.root}/app/assets/images/1.jpg", "#{Rails.root}/app/assets/images/2.jpg", "#{Rails.root}/app/assets/images/3.jpg",
				"#{Rails.root}/app/assets/images/4.jpg", "#{Rails.root}/app/assets/images/5.jpg", "#{Rails.root}/app/assets/images/6.jpg",
				"#{Rails.root}/app/assets/images/9.jpg", "#{Rails.root}/app/assets/images/8.jpg", "#{Rails.root}/app/assets/images/7.jpg"].sample
	shop.image = File.open(img)
	shop.save!

30.times do
	Shop.create(
	owner_id: (1..51).to_a.sample,
	address: (800..4000).to_a.sample.to_s + ' ' + ['International Boulevard', 'MacArthur Boulevard', 'Broadway'].sample,
	city: "Oakland",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

30.times do
	Shop.create(
	owner_id: (1..51).to_a.sample,
	address: (10000..30000).to_a.sample.to_s + ' ' + ['Ventura Boulevard', 'Sepulveda Boulevard', 'Mulholland Drive', 'Rodeo Drive', 'Santa Monica Boulevard', 'Sunset Boulevard', 'Hollywood Boulevard'].sample,
	city: 'Los Angeles',
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

################

30.times do
	Shop.create(
	owner_id: (1..51).to_a.sample,
	address: (100..1500).to_a.sample.to_s + ' ' + ["Avenue des Champs Elysées", "Rue de Passy", "Rue de Rennes", "Boulevard Haussmann", "Avenue Montaigne", "Rue de Rivoli-Le Marais"].sample,
	city: "Paris",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

#############

30.times do
	Shop.create(
	owner_id: (1..51).to_a.sample,
	address: (1..1000).to_a.sample.to_s + ' ' + ["Kalverstaat", "Leidsestraat", "P.C.Hooftstraat", "Cornelis Schuytstraat", "Utrechtsestraat", "Beethovenstraat"].sample,
	city: "Amsterdam",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

##############

30.times do
	Shop.create(
	owner_id: (1..51).to_a.sample,
	address: (1..1000).to_a.sample.to_s + ' ' + ["Via Condotti", "Via Borgogonona", "Via Frattina", "Via del Corso", "Via Cola di Rienzo", "Via Ottaviano", "Viale Giulio Cesare"].sample,
	city: "Rome",
	description: Faker::Lorem.paragraph(6),
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
end

user1 = User.find(1)
user2 = User.find(2)

600.times do

def paramz
	shop_id = Faker::Number.between(1, 270)
	shop = Shop.find(shop_id)
	owner_id = (shop.owner_id)
	renter_id = Faker::Number.between(1,51)
	return [shop_id, owner_id, renter_id] unless renter_id == owner_id
	return paramz
end

x = paramz

	Reservation.create(
	approved: false,
	owner_id: x[1],
	renter_id: x[2],
	shop_id: x[0],
	start_day: Date.new(Faker::Number.between(2015, 2016), Faker::Number.between(1,12), Faker::Number.between(1,20)),
	end_day: Date.new(Faker::Number.between(2017, 2018), Faker::Number.between(1,12), Faker::Number.between(1,20)),
	)
end

600.times do
	Review.create(
	shop_id: (1..270).to_a.sample,
	user_id: (1..51).to_a.sample,
	title: Faker::Lorem.word,
	body: Faker::Lorem.paragraph(6)
	)
end
