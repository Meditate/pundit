FactoryGirl.define do
  factory :user do
    email {Faker::Internet.safe_email}
    password 'password'

    trait :admin do
      role 'admin'
    end
  end
end
