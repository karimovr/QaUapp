FactoryGirl.define do
  sequence :email do |n|
    "user_#{n}@test.com"
  end
  factory :user do
    email
    password '123456789'
    password_confirmation '123456789'
    
  end

end
