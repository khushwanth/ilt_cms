FactoryGirl.define do
    factory :user do
    sequence(:email) { Faker::Internet.email }
    name 'TestName'
    password '123456'
    password_confirmation '123456'
    admin true
    confirmed_at Date.today
    end
  end