# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "dhh@gmail.com"
    password_digest "HairGel"
  end
end
