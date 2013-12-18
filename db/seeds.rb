Category.delete_all
Item.delete_all
OrderItem.delete_all
User.delete_all
Order.delete_all
Restaurant.delete_all
Role.delete_all
Region.delete_all
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

RESTAURANTS_COUNT = 200
ITEMS_PER_CATEGORY = 6
CATEGORIES_PER_RESTAURANT = 4
USERS_COUNT = 100
RESTAURANT_ADMINS_PER_RESTAURANT = 2
STOCKERS_PER_RESTAURANT = 2
ORDERS_COUNT = 50
ORDER_ITEMS_COUNT = 3

#RESTAURANTS_COUNT = 10000
#ITEMS_PER_CATEGORY = 6
#CATEGORIES_PER_RESTAURANT = 4
#USERS_COUNT = 100000
#RESTAURANT_ADMINS_PER_RESTAURANT = 2
#STOCKERS_PER_RESTAURANT = 2
#ORDERS_COUNT = 50
#ORDER_ITEMS_COUNT = 3

restaurant_counter = 0
items_counter = 0
categories_counter = 0
users_counter = 0
restaurant_admins_counter = 0
stockers_counter = 0
orders_counter = 0
order_items_counter = 0

REGIONS = ["AL", "AK", "AR", "AZ", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KA", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT","VA", "WA", "WV", "WI", "WY"] 

REGIONS.each do |region|
  Region.create(name: region)
end

RESTAURANTS_COUNT.times do
  generated_name = "KFC_#{restaurant_counter += 1}"
  generated_description = "KFC is good"
  num = Random.new.rand(20)
  case
  when num%2==0 then status = 'pending'; display=false;
  when num%3==0 then status = 'rejected'; display=false;
  else status = 'approved'; display=true;
  end
  r = Restaurant.create(name: generated_name, description: generated_description, status: status, display: display, region: Region.find(Random.new.rand(1..50)))

  RESTAURANT_ADMINS_PER_RESTAURANT.times do
    u = User.create(email: "BobAdmin_#{restaurant_admins_counter += 1}@example.com", password: "password")
    Role.create!(restaurant: r, user: u, level: "admin")
  end

  STOCKERS_PER_RESTAURANT.times do
    u = User.create(email: "JohnStocker_#{stockers_counter += 1}@example.com", password: "password")
    Role.create!(restaurant: r, user: u, level: "stocker")
  end

  CATEGORIES_PER_RESTAURANT.times do
    c = Category.create(name: "Dinner_#{categories_counter += 1}", restaurant: r)

    ITEMS_PER_CATEGORY.times do
      Item.create({name: "Wings_#{items_counter += 1}", description: "Hot chicken wings", price: Random.new.rand(20), image_url: "pp.png", category: c})
    end
  end
end

USERS_COUNT.times do
  u = User.create!(email: "MikeUser_#{users_counter += 1}@example.com", password: "password")
  ORDERS_COUNT.times do
    o = Order.create(user: u, restaurant: Restaurant.find(Random.new.rand(1..RESTAURANTS_COUNT)), status: 'complete')
    ORDER_ITEMS_COUNT.times do
      OrderItem.create(order: o, item: Item.find(Random.new.rand(1..ITEMS_PER_CATEGORY)), quantity: Random.new.rand(10))
    end
  end
end
