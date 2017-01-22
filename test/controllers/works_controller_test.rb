# frozen_string_literal: true
require "test_helper"

class WorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @work = create(:work, user: @user)
  end

  test "should get index" do
    get works_url
    assert_response :success
  end

  test "should show work" do
    get work_url(@work)
    assert_response :success
  end

  test "should not get new" do
    get new_work_url
    assert_redirected_to new_user_session_url
  end

  test "should get new" do
    sign_in @user
    get new_work_url
    assert_response :success
  end

  test "should not create work" do
    assert_no_difference("Work.count") do
      work = build(:work)
      post works_url, params: {
        work: { description: work.description, title: work.title, work_image: work_image }
      }
    end

    assert_redirected_to new_user_session_url
  end

  test "should create work" do
    sign_in @user
    assert_difference("Work.count") do
      work = build(:work)
      post works_url, params: {
        work: { description: work.description, title: work.title, work_image: work_image }
      }
    end

    assert_redirected_to work_url(Work.last)
  end

  test "should not get edit" do
    get edit_work_url(@work)
    assert_redirected_to new_user_session_url
  end

  test "should get edit" do
    sign_in @user
    get edit_work_url(@work)
    assert_response :success
  end

  test "should not update work" do
    put work_url(@work), params: {
      work: { description: @work.description, title: @work.title, work_image: work_image }
    }
    assert_redirected_to new_user_session_url
  end

  test "should update work" do
    sign_in @user
    put work_url(@work), params: {
      work: { description: @work.description, title: @work.title, work_image: work_image }
    }
    assert_redirected_to work_url(@work)
  end

  test "should not destroyo work" do
    assert_no_difference("Work.count", -1) do
      delete work_url(@work)
    end
    assert_redirected_to new_user_session_url
  end

  test "should destroy work" do
    sign_in @user
    assert_difference("Work.count", -1) do
      delete work_url(@work)
    end
    assert_redirected_to works_url
  end

  private

  def work_image
    fixture_file_upload("files/test.jpg", "image/jpg")
  end
end
