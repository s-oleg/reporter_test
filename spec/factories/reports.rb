# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    name "MyString"
    description "MyString"
    height 1.5
    width 1.5
    length 1.5
  end
end
