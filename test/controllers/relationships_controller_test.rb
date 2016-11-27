# frozen_string_literal: true
require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @followed_user = create(:user)
  end

  test 'should not create' do
    assert_no_difference('Relationship.count', 1) do
      post relationships_url, params: { followed_id: @followed_user.id }
    end
    assert_redirected_to new_user_session_url
  end

  test 'should create' do
    sign_in @user
    assert_difference('Relationship.count', 1) do
      post relationships_url, params: { followed_id: @followed_user.id }
    end
    assert_redirected_to user_url(@followed_user)
  end

  test 'should create when ajax' do
    sign_in @user
    assert_difference('Relationship.count', 1) do
      post relationships_url, params: { followed_id: @followed_user.id }, xhr: true
    end
  end

  test 'should not destroy' do
    relationship = create(:relationship, follower: @user, followed: @followed_user)
    assert_no_difference('Relationship.count', -1) do
      delete relationship_url(relationship)
    end
    assert_redirected_to new_user_session_url
  end

  test 'should destroy' do
    relationship = create(:relationship, follower: @user, followed: @followed_user)
    sign_in @user
    assert_difference('Relationship.count', -1) do
      delete relationship_url(relationship)
    end
    assert_redirected_to user_url(@followed_user)
  end

  test 'should destroy when ajax' do
    relationship = create(:relationship, follower: @user, followed: @followed_user)
    sign_in @user
    assert_difference('Relationship.count', -1) do
      delete relationship_url(relationship), xhr: true
    end
  end
end
