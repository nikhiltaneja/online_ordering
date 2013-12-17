Category.delete_all
Item.delete_all
OrderItem.delete_all
User.delete_all
Order.delete_all
Restaurant.delete_all
Role.delete_all
PlatformAdmin.delete_all

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

RESTAURANTS_COUNT = 10
REGIONS_COUNT = 5 
ITEMS_PER_RESTAURANT = 10
CATEGORIES_PER_RESTAURANT = 3
USERS_COUNT = 10
RESTAURANT_ADMINS_PER_RESTAURANT = 2
STOCKERS_PER_RESTAURANT = 2


# RESTAURANTS_COUNT = 10000
# REGIONS_COUNT = 30 
# ITEMS_PER_RESTAURANT = 20
# CATEGORIES_PER_RESTAURANT = 3
# USERS_COUNT = 100000
# RESTAURANT_ADMINS_PER_RESTAURANT = 2
# STOCKERS_PER_RESTAURANT = 2

restaurant_counter = 0
regions_counter = 0
items_counter = 0
categories_counter = 0
users_counter = 0
restaurant_admins_counter = 0
stockers_counter = 0

USERS_COUNT.times do
  User.create!(email: "MikeUser_#{users_counter += 1}@example.com", password: "password")
end

RESTAURANTS_COUNT.times do 
  generated_name = "KFC_#{restaurant_counter += 1}"
  generated_description = "KFC is good"
  r = Restaurant.create(name: generated_name, description: generated_description)

  RESTAURANT_ADMINS_PER_RESTAURANT.times do
    u = User.create(email: "BobAdmin_#{restaurant_admins_counter += 1}@example.com", password: "password")
    Role.create!(restaurant: r, user: user, level: "admin")
  end

  STOCKERS_PER_RESTAURANT.times do
    u = User.create(email: "JohnStocker_#{stockers_counter += 1}@example.com", password: "password")
    Role.create!(restaurant: r, user: user, level: "stocker")
  end

  CATEGORIES_PER_RESTAURANT.times do
    c = Category.create(name: "Dinner_#{categories_counter += 1}", restaurant: r)
    
    ITEMS_PER_RESTAURANT.times do
      Item.create({name: "Wings_#{items_counter += 1}", description: "Hot chicken wings", price: Random.new.rand(20), image_url: "pp.png", category: c})
    end
  end
end

total_restaurants = Restaurant.all

total_restaurants[0..4].each do |r|
  r.approve
end

total_restaurants[5..7].each do |r|
  r.reject
end

