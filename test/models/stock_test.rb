# frozen_string_literal: true
require 'test_helper'

class StockTest < ActiveSupport::TestCase
  test 'valid? is true' do
    assert build(:stock).valid?
  end

  test 'valid? is false' do
    refute build(:stock, user: nil).valid?
    refute build(:stock, work: nil).valid?
  end
end
