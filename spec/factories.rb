FactoryGirl.define do
  factory :user do
    email "User"
    password "1234"
  end

  factory :admin do
    email 'Admin'
    password '1234'
    admin true
  end
end
