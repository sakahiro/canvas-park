# frozen_string_literal: true
require "test_helper"

class StaticsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    create_list(:work, 3)
    get statics_top_url
    assert_response :success
  end

  test "should get about" do
    get statics_about_url
    assert_response :success
  end
end
