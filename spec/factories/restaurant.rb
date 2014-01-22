FactoryGirl.define do
  sequence :name do |n|
    "KFC_#{n}"
  end

  sequence :slug do |n|
    "kfc_#{n}"
  end

  factory :restaurant do
    name
    slug
    description "a food place"
    status "approved"
    display true
    association :region, factory: :region, name: "CA"
  end
end
