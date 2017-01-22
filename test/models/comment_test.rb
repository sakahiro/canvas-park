# frozen_string_literal: true
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "valid? is true" do
    assert build(:comment).valid?
  end

  test "valid? is false" do
    refute build(:comment, content: nil).valid?
    refute build(:comment, content: "a" * 251).valid?
    refute build(:comment, user_id: nil).valid?
    refute build(:comment, work_id: nil).valid?
  end
end
