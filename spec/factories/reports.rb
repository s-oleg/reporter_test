FactoryGirl.define do
  sequence(:name) { |n| "Name #{n}" }

  factory :report do
    name
    description 'MyString'
    height 1.5
    width 1.5
    length 1.5
    association :user
  end

end
