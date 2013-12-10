# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    level "MyString"
    restaurant nil
    user nil
  end
end
