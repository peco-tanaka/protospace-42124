class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # has_many :comments
  # commentsテーブル作成後解放

  validates :title, :catch_copy, :concept, :image, presence: true
end