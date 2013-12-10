FactoryGirl.define do
  factory :item do
    name "Nyan Cat"
    description  "Rainbow cat in space"
    price 500
    quantity 1
    association :category
  end
end
