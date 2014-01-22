FactoryGirl.define do
  factory :item do
    name "Chips and dip"
    description  "Tortilla chipa and Guacamole"
    price 500
    quantity 1
    association :category
  end

  factory :item_specific, class: Item do
    name "Chicken wings"
    description  "Zesty wings"
    price 700
    quantity 1
  end
end
