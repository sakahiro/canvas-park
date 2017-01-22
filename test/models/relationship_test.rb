# frozen_string_literal: true
require "test_helper"

class RelationshipTest < ActiveSupport::TestCase
  setup do
    @relationship = build(:relationship)
  end

  test "should be valid" do
    assert @relationship.valid?
  end

  test "should require a follower_id" do
    @relationship.follower_id = nil
    refute @relationship.valid?
  end

  test "should require a followed_id" do
    @relationship.followed_id = nil
    refute @relationship.valid?
  end
end
