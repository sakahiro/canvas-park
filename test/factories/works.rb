# frozen_string_literal: true
FactoryGirl.define do
  factory :work do
    title 'a' * 50
    description 'a' * 500

    user
  end
end
