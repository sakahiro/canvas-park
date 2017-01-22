# frozen_string_literal: true
class Work < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :stocking_user, through: :stocks, source: :user
  belongs_to :user

  mount_uploader :image, WorkImageUploader

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
  validates :image, presence: true

  validate :image_size

  def image_size
    errors.add(:image, "ファイルサイズが大きすぎます。5MB以下にしてください") if image.size > 5.megabytes
  end
end
