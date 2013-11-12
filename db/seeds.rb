# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create( provider: "twitter", uid: "525439758", name: "Billy Griffin", admin: true )

categories = Category.create([
  { name: 'Entrees' }, 
  { name: 'Side Dishes' }, 
  { name: 'Delightful Drinks' }])

main = Category.first.items.create([
  { name: 'Pulled Pork Sandy', description: "wonderful and awesome", price: 5}, 
  { name: 'Beef Brisket', description: "Dry rubbed and Aged to perfection", price: 9, image_url: "pp.jpg"}])

side = Category.find(2).items.create([
  { name: 'Mac and Cheese,', description: "cheesie and Delicious", price: 5}, 
  { name: 'Baked Beans', description: "Hearty and Awesome", price: 3}])

drinks = Category.find(3).items.create([
  { name: 'Iced Tea,', description: "Southern Style Sweet Tea", price: 2}, 
  { name: 'Naragansett Beer', description: "Borderline Disgusting, but it works", price: 4}])
