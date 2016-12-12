# frozen_string_literal: true
require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'should create comment' do
    user = create(:user)
    sign_in(user)
    comment = build(:comment, user: user)
    assert_difference('Comment.count', 1) do
      post comments_url, params: { comment: comment.attributes }
    end
    assert_redirected_to work_url(comment.work)
  end

  test 'should not create comment' do
    user = create(:user)
    sign_in(user)
    comment = build(:comment, user: user)
    assert_no_difference('Comment.count') do
      post comments_url, params: { comment: { content: nil, work_id: comment.work.id } }
    end
    assert_response :success
  end

  test 'should not create comment without signin' do
    post comments_url, params: { comment: build(:comment).attributes }
    assert_redirected_to new_user_session_url
  end

  test 'should destroy comment' do
    user = create(:user)
    sign_in(user)
    comment = create(:comment, user: user)
    assert_difference('Comment.count', -1) do
      delete comment_url(comment)
    end
    assert_redirected_to work_url(comment.work)
  end

  test 'should not destroy comment without signin' do
    comment = create(:comment)
    delete comment_url(comment)
    assert_redirected_to new_user_session_url
  end
end
