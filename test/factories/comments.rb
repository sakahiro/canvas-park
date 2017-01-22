# frozen_string_literal: true
FactoryGirl.define do
  factory :comment do
    content "a" * 250

    association :user
    association :work
  end
end
