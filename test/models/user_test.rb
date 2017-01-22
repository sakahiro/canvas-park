# frozen_string_literal: true
require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid? is true" do
    assert build(:user).valid?
  end

  test "valid? is false" do
    refute build(:user, name: "a" * 31).valid?
  end

  test "should follow and unfollow a user" do
    saka = create(:user, name: "saka")
    hiro = create(:user, name: "hiro")

    refute saka.following?(hiro)
    refute hiro.followed_by?(saka)
    saka.follow(hiro)
    assert saka.following?(hiro)
    assert hiro.followed_by?(saka)
    saka.unfollow(hiro)
    refute saka.following?(hiro)
    refute hiro.followed_by?(saka)
  end
end
