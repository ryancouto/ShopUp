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

descriptions = [
"We have a beautiful retail space selling fair trade, upcycled and vintage handcrafted designs. We are looking for designers who have products that compliment our store for weekends or longer term pop up sales within our store. We can adjust our window display to feature some of your products and have plenty of table and shelf space ready for you to sell! We even have dress forms you can use. So contact us to see if you're a fit for us",
"Great location centrally located near the freeway and popular restaurants. Each warehouse has its own meters and bathrooms and green space available. We rent by the hour, day, week, month or up to 1 year lease.",
"White walls, high ceilings, 14' windows with ledges (great for window displays), easy to modify track lighting, natural daylight, this space is perfect for a popup shop, party, fashion presentation, exhibition, workshop, and more!
The space contains a storage space/coat closet directly accessible as well as desk space and wi-fi. Includes a restroom, air conditioning, heat.",
"This intimate space is perfect for private events,product demonstrations, creative art space, gallery display, filming, intimate parties. Private entrance is available. Lighting, outdoor music, tables, chairs, and mats are available. The overhead terrace can be covered for shade or exposed for additional sunlight.",
"There is a shared common area bathroom (upstairs shared with office Tenants) and a shared common area deck that has amazing views. Most recently was occupied by a vapor outlet. Not quite the fit for the neighborhood but the location is key. The furniture is optional and The awning is in the process of being painted over. The space is available immediately.",
"Spacious tropical interior with bright, happy decor and vibe. Available for evening use after 4pm except for Friday and Saturday nights, and anytime most Mondays. Flexible seating arrangements along with small bay window seating.",
"This ground floor boutique is the perfect space for all of your hand-made goods. Our building has a rustic-chic vibe, and our storefront features a beautiful barn-door entrance from the 1890s. We love real objects made by real people. Our products run the gamut from feminine to rock-star. Our entry is beautiful and could potentially host plants and horticulture items."
]
#######
20.times do
	shop = Shop.new(
	owner_id: (1..51).to_a.sample,
	address: (100..1800).to_a.sample.to_s + ' ' + ['Broadway Avenue', 'Amsterdam Avenue', 'Park Avenue', 'Madison Avenue'].sample,
	city: "New York",
	description: descriptions.sample,
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
	img = ["#{Rails.root}/app/assets/images/1.jpg", "#{Rails.root}/app/assets/images/2.jpg", "#{Rails.root}/app/assets/images/3.jpg",
				"#{Rails.root}/app/assets/images/4.jpg", "#{Rails.root}/app/assets/images/5.jpg", "#{Rails.root}/app/assets/images/6.jpg",
				"#{Rails.root}/app/assets/images/9.jpg", "#{Rails.root}/app/assets/images/8.jpg", "#{Rails.root}/app/assets/images/7.jpg"].sample
	shop.image = File.open(img)
	shop.save!
end

20.times do
	shop = Shop.new(
	owner_id: (1..51).to_a.sample,
	address: (100..1800).to_a.sample.to_s + ' ' + ['Broadway', 'Atlantic Avenue', 'Bushwick Avenue', 'Bedford Avenue', 'Manhattan Avenue'].sample,
	city: "Brooklyn",
	description: descriptions.sample,
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
	img = ["#{Rails.root}/app/assets/images/1.jpg", "#{Rails.root}/app/assets/images/2.jpg", "#{Rails.root}/app/assets/images/3.jpg",
				"#{Rails.root}/app/assets/images/4.jpg", "#{Rails.root}/app/assets/images/5.jpg", "#{Rails.root}/app/assets/images/6.jpg",
				"#{Rails.root}/app/assets/images/9.jpg", "#{Rails.root}/app/assets/images/8.jpg", "#{Rails.root}/app/assets/images/7.jpg"].sample
	shop.image = File.open(img)
	shop.save!
end

20.times do
	shop = Shop.new(
	owner_id: (1..51).to_a.sample,
	address: (100..350).to_a.sample.to_s + ' ' + ['Oxford Street', 'Regent Street', 'Carnaby Street', "King's Road", 'Kensington', 'Camden Town'].sample,
	city: "London",
	description: descriptions.sample,
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
	img = ["#{Rails.root}/app/assets/images/1.jpg", "#{Rails.root}/app/assets/images/2.jpg", "#{Rails.root}/app/assets/images/3.jpg",
				"#{Rails.root}/app/assets/images/4.jpg", "#{Rails.root}/app/assets/images/5.jpg", "#{Rails.root}/app/assets/images/6.jpg",
				"#{Rails.root}/app/assets/images/9.jpg", "#{Rails.root}/app/assets/images/8.jpg", "#{Rails.root}/app/assets/images/7.jpg"].sample
	shop.image = File.open(img)
	shop.save!
end
#################
20.times do
	shop = Shop.new(
	owner_id: (1..51).to_a.sample,
	address: (100..2000).to_a.sample.to_s + ' ' + ['Powell Street', 'Geary Boulevard', 'Market Street', 'Fillmore Street', 'Mission Boulevard', 'Haight Street', 'Ashbury Street', 'Divisadero Street'].sample,
	city: "San Francisco",
	description: descriptions.sample,
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
		owner_id: 1,
		address: (100..2000).to_a.sample.to_s + ' ' + ['Powell Street', 'Geary Boulevard', 'Market Street', 'Fillmore Street', 'Mission Boulevard', 'Haight Street', 'Ashbury Street', 'Divisadero Street'].sample,
		city: "San Francisco",
		description: descriptions.sample,
		price: Faker::Number.number(3),
		size: Faker::Number.number(4)
		)
	img = ["#{Rails.root}/app/assets/images/1.jpg", "#{Rails.root}/app/assets/images/2.jpg", "#{Rails.root}/app/assets/images/3.jpg",
				"#{Rails.root}/app/assets/images/4.jpg", "#{Rails.root}/app/assets/images/5.jpg", "#{Rails.root}/app/assets/images/6.jpg",
				"#{Rails.root}/app/assets/images/9.jpg", "#{Rails.root}/app/assets/images/8.jpg", "#{Rails.root}/app/assets/images/7.jpg"].sample
	shop.image = File.open(img)
	shop.save!

20.times do
	shop = Shop.new(
	owner_id: (1..51).to_a.sample,
	address: (800..4000).to_a.sample.to_s + ' ' + ['International Boulevard', 'MacArthur Boulevard', 'Broadway'].sample,
	city: "Oakland",
	description: descriptions.sample,
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
	img = ["#{Rails.root}/app/assets/images/1.jpg", "#{Rails.root}/app/assets/images/2.jpg", "#{Rails.root}/app/assets/images/3.jpg",
				"#{Rails.root}/app/assets/images/4.jpg", "#{Rails.root}/app/assets/images/5.jpg", "#{Rails.root}/app/assets/images/6.jpg",
				"#{Rails.root}/app/assets/images/9.jpg", "#{Rails.root}/app/assets/images/8.jpg", "#{Rails.root}/app/assets/images/7.jpg"].sample
	shop.image = File.open(img)
	shop.save!
end

20.times do
	shop = Shop.new(
	owner_id: (1..51).to_a.sample,
	address: (10000..30000).to_a.sample.to_s + ' ' + ['Ventura Boulevard', 'Sepulveda Boulevard', 'Mulholland Drive', 'Rodeo Drive', 'Santa Monica Boulevard', 'Sunset Boulevard', 'Hollywood Boulevard'].sample,
	city: 'Los Angeles',
	description: descriptions.sample,
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
	img = ["#{Rails.root}/app/assets/images/1.jpg", "#{Rails.root}/app/assets/images/2.jpg", "#{Rails.root}/app/assets/images/3.jpg",
				"#{Rails.root}/app/assets/images/4.jpg", "#{Rails.root}/app/assets/images/5.jpg", "#{Rails.root}/app/assets/images/6.jpg",
				"#{Rails.root}/app/assets/images/9.jpg", "#{Rails.root}/app/assets/images/8.jpg", "#{Rails.root}/app/assets/images/7.jpg"].sample
	shop.image = File.open(img)
	shop.save!
end

################

15.times do
	shop = Shop.new(
	owner_id: (1..51).to_a.sample,
	address: (100..1500).to_a.sample.to_s + ' ' + ["Avenue des Champs Elysées", "Rue de Passy", "Rue de Rennes", "Boulevard Haussmann", "Avenue Montaigne", "Rue de Rivoli-Le Marais"].sample,
	city: "Paris",
	description: descriptions.sample,
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
	img = ["#{Rails.root}/app/assets/images/1.jpg", "#{Rails.root}/app/assets/images/2.jpg", "#{Rails.root}/app/assets/images/3.jpg",
				"#{Rails.root}/app/assets/images/4.jpg", "#{Rails.root}/app/assets/images/5.jpg", "#{Rails.root}/app/assets/images/6.jpg",
				"#{Rails.root}/app/assets/images/9.jpg", "#{Rails.root}/app/assets/images/8.jpg", "#{Rails.root}/app/assets/images/7.jpg"].sample
	shop.image = File.open(img)
	shop.save!
end

#############

15.times do
	shop = Shop.new(
	owner_id: (1..51).to_a.sample,
	address: (1..1000).to_a.sample.to_s + ' ' + ["Kalverstaat", "Leidsestraat", "P.C.Hooftstraat", "Cornelis Schuytstraat", "Utrechtsestraat", "Beethovenstraat"].sample,
	city: "Amsterdam",
	description: descriptions.sample,
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
	img = ["#{Rails.root}/app/assets/images/1.jpg", "#{Rails.root}/app/assets/images/2.jpg", "#{Rails.root}/app/assets/images/3.jpg",
				"#{Rails.root}/app/assets/images/4.jpg", "#{Rails.root}/app/assets/images/5.jpg", "#{Rails.root}/app/assets/images/6.jpg",
				"#{Rails.root}/app/assets/images/9.jpg", "#{Rails.root}/app/assets/images/8.jpg", "#{Rails.root}/app/assets/images/7.jpg"].sample
	shop.image = File.open(img)
	shop.save!
end

##############

15.times do
	shop = Shop.new(
	owner_id: (1..51).to_a.sample,
	address: (1..1000).to_a.sample.to_s + ' ' + ["Via Condotti", "Via Borgogonona", "Via Frattina", "Via del Corso", "Via Cola di Rienzo", "Via Ottaviano", "Viale Giulio Cesare"].sample,
	city: "Rome",
	description: descriptions.sample,
	price: Faker::Number.number(3),
	size: Faker::Number.number(4)
	)
	img = ["#{Rails.root}/app/assets/images/1.jpg", "#{Rails.root}/app/assets/images/2.jpg", "#{Rails.root}/app/assets/images/3.jpg",
				"#{Rails.root}/app/assets/images/4.jpg", "#{Rails.root}/app/assets/images/5.jpg", "#{Rails.root}/app/assets/images/6.jpg",
				"#{Rails.root}/app/assets/images/9.jpg", "#{Rails.root}/app/assets/images/8.jpg", "#{Rails.root}/app/assets/images/7.jpg"].sample
	shop.image = File.open(img)
	shop.save!
end

user1 = User.find(1)
user2 = User.find(2)

600.times do

def paramz
	shop_id = Faker::Number.between(1, 165)
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

reviews = [
	"Loved this shop! Would rent again!",
	"Great commercial space, hope to rent again soon!",
	"Beautiful shop in a great neighborhood, I will be recommending to all of my friends!",
	"I've rented this shop multiple times, and I've never been disappointed. Great shop, great owner, great neighborhood.",
	"Wow! Love this place!",
	"This shop was great! Wow!"
]

600.times do
	Review.create(
	shop_id: (1..165).to_a.sample,
	user_id: (1..51).to_a.sample,
	title: Faker::Lorem.word,
	body: reviews.sample
	)
end
