# frozen_string_literal: true
require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user, confirmed_at: Time.zone.now)
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should not get edit' do
    get edit_user_url(@user)
    assert_redirected_to new_user_session_url
  end

  test 'should get edit' do
    sign_in @user
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should not update user' do
    put user_url(@user), params: { user: { user_name: @user.user_name } }
    assert_redirected_to new_user_session_url
  end

  test 'should update user' do
    sign_in @user
    put user_url(@user), params: { user: { user_name: @user.user_name } }
    assert_redirected_to user_url(@user)
  end
end
