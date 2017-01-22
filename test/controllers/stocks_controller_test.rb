# frozen_string_literal: true
require "test_helper"

class StocksControllerTest < ActionDispatch::IntegrationTest
  test "should create stock" do
    sign_in(create(:user))
    work = create(:work)
    assert_difference("Stock.count", 1) do
      post stocks_url, params: { stock: { work_id: work.id } }
    end
    assert_redirected_to work_url(work)
  end

  test "should create stock when ajax" do
    sign_in(create(:user))
    work = create(:work)
    assert_difference("Stock.count", 1) do
      post stocks_url, params: { stock: { work_id: work.id } }, xhr: true
    end
  end

  test "should not create stock without signin" do
    work = create(:work)
    assert_no_difference("Stock.count") do
      post stocks_url, params: { stock: { work_id: work.id } }
    end
    assert_redirected_to new_user_session_url
  end

  test "should destroy stock" do
    user = create(:user)
    sign_in(user)
    work = create(:work)
    stock = create(:stock, work: work, user: user)
    assert_difference("Stock.count", -1) do
      delete stock_url(stock)
    end
    assert_redirected_to work_url(work)
  end

  test "should destroy stock when ajax" do
    user = create(:user)
    sign_in(user)
    work = create(:work)
    stock = create(:stock, work: work, user: user)
    assert_difference("Stock.count", -1) do
      delete stock_url(stock), xhr: true
    end
  end

  test "should not destroy stock without signin" do
    user = create(:user)
    work = create(:work)
    stock = create(:stock, work: work, user: user)
    assert_no_difference("Stock.count") do
      delete stock_url(stock)
    end
    assert_redirected_to new_user_session_url
  end
end
