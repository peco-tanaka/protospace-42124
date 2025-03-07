class User < ApplicationRecord
  has_many :prototypes
  # has_many :comment
  # commentsテーブル作成後に解放

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :profile, :occupation, :position, presence: true
end