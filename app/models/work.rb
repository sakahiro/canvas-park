# frozen_string_literal: true
class Work < ApplicationRecord
  belongs_to :user

  mount_uploader :work_image, WorkImageUploader

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
  validates :work_image, presence: true

  validate :image_size

  def image_size
    errors.add(:work_image, 'ファイルサイズが大きすぎます。5MB以下にしてください') if work_image.size > 5.megabytes
  end
end
