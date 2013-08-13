FactoryGirl.define do
  factory :user do
    before(:create) { FactoryGirl.create(:role) }

    email { Faker::Internet.email }
    password '1qaz2wsx'
    password_confirmation '1qaz2wsx'
  end

  factory :admin, parent: :user do
    after(:create) do |user|
      user.role = FactoryGirl.create(:role, name: 'admin')
      user.save
    end
  end
end
