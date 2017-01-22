# frozen_string_literal: true
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :work do
    title "a" * 50
    description "a" * 500
    work_image { fixture_file_upload("#{Rails.root}/test/fixtures/files/test.jpg", "image/jpg") }

    user
  end
end
