class Prototype < ApplicationRecord
  belongs_to :user
  # has_many :comments
  # commentsテーブル作成後解放

  validates :title, :catch_copy, :concept, :user, presence: true
end