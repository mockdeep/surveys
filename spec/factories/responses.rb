# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :response do
    user nil
    blank nil
    text "MyString"
  end
end
