FactoryGirl.define do

  sequence :email do |n|
    "test#{n}@example.com" #test1@example.com and then test2@example.com etc...
  end

  factory :user do
    first_name 'Joe'
    last_name 'Doe'
    email { generate :email }
    password 'Ilovemywife'
    password_confirmation 'Ilovemywife'
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password 'Ilovemywife'
    password_confirmation 'Ilovemywife'
  end
end
