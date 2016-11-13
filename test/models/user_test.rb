# frozen_string_literal: true
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid? is true' do
    assert build(:user).valid?
  end

  test 'valid? is false' do
    create(:user, user_name: 'canvas')
    refute build(:user, user_name: 'a' * 31).valid?
    refute build(:user, user_name: 'canvas').valid?
  end
end
