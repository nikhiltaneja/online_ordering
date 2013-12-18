FactoryGirl.define do
  factory :item do
    name "Nyan Cat"
    description  "Rainbow cat in space"
    price 500
    quantity 1
    association :category
  end

  factory :item_specific, class: Item do
    name "Nyan Catty"
    description  "Rainbow cat in spaces"
    price 500
    quantity 1
  end
end
