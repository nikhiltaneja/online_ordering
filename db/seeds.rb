Category.delete_all
Item.delete_all
OrderItem.delete_all
User.delete_all
Order.delete_all
Restaurant.delete_all

user = User.create( email: "asdf@asdf.com", password: "asdfasdf")
user = User.create( email: "qwer@qwer.com", password: "qwerqwer")
user = User.create( email: "zxcv@zxcv.com", password: "zxcvzxcv")

[ "Billy's BBQ",
  "Moe's Q Shack",
  "Knife & fork",
  "McDonalds",
  "Burker King",
  "Wendys",
  "Five Guys"].each do |restaurant_name|
  Restaurant.create(name:restaurant_name)
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
