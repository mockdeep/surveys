# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey do
    name Faker::Lorem.sentence
    body Faker::Lorem.paragraph
  end
end
