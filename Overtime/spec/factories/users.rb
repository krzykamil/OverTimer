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
    phone "5558887771"
  end

  factory :other_user, class: "User" do
    first_name 'Oje'
    last_name 'Oed'
    email { generate :email }
    password 'Ihatemywife'
    password_confirmation 'Ihatemywife'
    phone "5558887771"
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password 'Ilovemywife'
    password_confirmation 'Ilovemywife'
    phone "5558887771"
  end

  factory :non_authorized_user, class: "User" do
    first_name 'Non'
    last_name 'Authorized'
    email { generate :email }
    password 'nonauth'
    password_confirmation 'nonauth'
    phone "5558887771"
  end
end
