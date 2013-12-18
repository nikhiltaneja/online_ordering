FactoryGirl.define do
  sequence :name do |n|
    "kfc#{n}"
  end

  sequence :slug do |n|
    "kfc#{n}"
  end

  factory :restaurant do
    name 
    slug
    description "a food place"
    status "approved"
    display true
  end
end
