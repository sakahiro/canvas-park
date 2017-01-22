# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    sequence(:id)
    email { "canvas#{id}@park.com" }
    password "password"
    password_confirmation "password"
    name { "cavas#{id}" }
    confirmed_at { Time.zone.now }
  end
end
