Category.delete_all
Item.delete_all
OrderItem.delete_all
User.delete_all
Order.delete_all
Restaurant.delete_all
Role.delete_all

user = User.create( email: "denvergschool@gmail.com", password: "password")
PlatformAdmin.create(user_id: user.id)
user = User.create( email: "nt@example.com", password: "password")
PlatformAdmin.create(user_id: user.id)
user = User.create( email: "qt@example.com", password: "asdfasdf")
PlatformAdmin.create(user_id: user.id)
user = User.create( email: "kp@example.com", password: "password")
PlatformAdmin.create(user_id: user.id)

user = User.create( email: "asdf@asdf.com", password: "asdfasdf")
user = User.create( email: "qwer@qwer.com", password: "qwerqwer")
user = User.create( email: "zxcv@zxcv.com", password: "zxcvzxcv")

{ "Billy's BBQ" => "Barbecue restaurant",
  "Moe's Q Shack" => "BBQ shack",
  "Knife & fork" => "Upscale Southern food",
  "McDonalds" => "America's finest",
  "Burker King" => "At BK you got it",
  "Wendys" => "Dave Thomas is our hero",
  "Five Guys" => "The best burger in town"
}.each do |restaurant_name, restaurant_description|
  r = Restaurant.create(name:restaurant_name, description:restaurant_description)
  Role.create!(restaurant: r, user: user, level: "admin")
end

Restaurant.all[0..4].each do |restaurant|
  restaurant.status = "approved"
  restaurant.display = true
  restaurant.save
end

categories = Category.create([
  { name: 'Entrees' },
  { name: 'Side Dishes' },
  { name: 'Delightful Drinks' }
  ])

entrees = Category.where(:name => 'Entrees').to_a.first
entrees.items.create([
  { name: 'Pulled Pork Sandy', description: "Not a Sloppy Joe", price: 7, image_url: "pp.png"},
  { name: 'Beef Brisket', description: "Dry rubbed and aged to perfection", price: 8, image_url: "brisket.png"},
  { name: 'Slab-o-Ribs', description: "Finger lick'n good", price: 9, image_url: "ribs.png"}
  ])

sides = Category.where(:name => 'Side Dishes').to_a.first
sides.items.create([
  { name: 'Mac and Cheese', description: "Soooooo cheesy", price: 3, image_url: "mac.png"},
  { name: 'Baked Beans', description: "Better than Bush's", price: 3, image_url: "beans.png"},
  { name: 'Cornbread', description: "Made with real corn", price: 3, image_url: "cornbread.png"}
  ])

drinks = Category.where(:name => 'Delightful Drinks').to_a.first
drinks.items.create([
  { name: 'Iced Tea', description: "Southern Style Sweet Tea", price: 2, image_url: "icedtea.png"},
  { name: 'Naragansett Beer', description: "Borderline Disgusting, but it works", price: 4, image_url: "beer.png"},
  { name: 'Pop', description: "It's not soda", price: 2, image_url: "pop.png"}
  ])
