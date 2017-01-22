# frozen_string_literal: true
require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should not show user" do
    get user_url(@user)
    assert_redirected_to new_user_session_url
  end

  test "should show user" do
    sign_in @user
    get user_url(@user)
    assert_response :success
  end

  test "should not get edit" do
    get edit_user_url(@user)
    assert_redirected_to new_user_session_url
  end

  test "should get edit" do
    sign_in @user
    get edit_user_url(@user)
    assert_response :success
  end

  test "should not update user" do
    put user_url(@user), params: { user: { user_name: @user.user_name } }
    assert_redirected_to new_user_session_url
  end

  test "should update user" do
    sign_in @user
    put user_url(@user), params: { user: { user_name: @user.user_name } }
    assert_redirected_to user_url(@user)
  end

  test "should not show following page" do
    get following_user_url(@user)
    assert_redirected_to new_user_session_url
  end

  test "should show following page" do
    sign_in @user
    get following_user_url(@user)
    assert_response :success
  end

  test "should not show followers page" do
    get followers_user_url(@user)
    assert_redirected_to new_user_session_url
  end

  test "should show followers page" do
    sign_in @user
    get followers_user_url(@user)
    assert_response :success
  end
end
