class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # メールアドレスをバリデーション前に全て小文字に変換するコールバック
  before_save { email.downcase! }
  #presence: trueは空打ち禁止用
  validates :name, presence: true, length: { maximum: 50 }
  # メールの正規表現を定義
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
