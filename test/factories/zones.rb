# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :zone do
    name "MyString"
    user_id 1
    camera_id 1
    latitude 1.5
    longitude 1.5
    radius 1.5
    triggered false
  end
end
