FactoryGirl.define do

  factory :restaurant do
    name "chickfila"
    slug "chickfila"
    description "fried chicken"
    status "approved"
    display true
    association :region, factory: :region
  end
end
