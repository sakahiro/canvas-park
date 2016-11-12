# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "canvas#{n}@park.com"
    end
  end
end
