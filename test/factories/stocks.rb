# frozen_string_literal: true
FactoryGirl.define do
  factory :stock do
    association :user
    association :work
  end
end
