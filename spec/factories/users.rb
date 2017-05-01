FactoryGirl.define do
  sequence :email do |n|
    "user_#{n}@example.com"
  end

  factory :user do
    name 'test'
    email
    password '12345678'
    password_confirmation '12345678'
  end

  factory :confirmed_user, parent: :user do |u|
    u.confirmed_at Time.now
  end
end
