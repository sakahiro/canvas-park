# frozen_string_literal: true
require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  test 'valid? is true' do
    assert build(:work).valid?
  end

  test 'valid? is false' do
    refute build(:work, title: nil).valid?
    refute build(:work, title: 'a' * 51).valid?
    refute build(:work, description: 'a' * 501).valid?
    refute build(:work, user_id: nil).valid?
  end
end
