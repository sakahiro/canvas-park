# frozen_string_literal: true
class Work < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
end
