
Category.delete_all
Item.delete_all
OrderItem.delete_all
User.delete_all
Order.delete_all

user = User.create( provider: "twitter", uid: "525439758", name: "Billy Griffin", admin: true )

categories = Category.create([
  { name: 'Entrees' }, 
  { name: 'Side Dishes' }, 
  { name: 'Delightful Drinks' }
  ])

entrees = Category.where(:name => 'Entrees').to_a.first
entrees.items.create([
  { name: 'Pulled Pork Sandy', description: "Not a Sloppy Joe", price: 7, image_url: "20.jpg"}, 
  { name: 'Beef Brisket', description: "Dry rubbed and aged to perfection", price: 8, image_url: "15.jpg"},
  { name: 'Slab-o-Ribs', description: "Finger lick'n good", price: 9, image_url: "18.jpg"} 
  ])

sides = Category.where(:name => 'Side Dishes').to_a.first
sides.items.create([
  { name: 'Mac and Cheese', description: "Soooooo cheesy", price: 3, image_url: "17.gif"}, 
  { name: 'Baked Beans', description: "Better than Bush's", price: 3, image_url: "19.jpg"},
  { name: 'Cornbread', description: "Made with real corn", price: 3, image_url: "14.jpg"}
  ])

drinks = Category.where(:name => 'Delightful Drinks').to_a.first
drinks.items.create([
  { name: 'Iced Tea', description: "Southern Style Sweet Tea", price: 2, image_url: "13.jpg"}, 
  { name: 'Naragansett Beer', description: "Borderline Disgusting, but it works", price: 4, image_url: "16.jpg"},
  { name: 'Pop', description: "It's not soda", price: 2, image_url: "21.jpg"}
  ])
