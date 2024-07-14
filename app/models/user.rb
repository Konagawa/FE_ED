class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_microposts, through: :favorites, source: :micropost
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

  def favorite(micropost)
    favorites.create(micropost: micropost) unless favorite?(micropost)
  end

  def unfavorite(micropost)
    favorites.find_by(micropost: micropost)&.destroy
  end

  def favorite?(micropost)
    favorite_microposts.include?(micropost)
  end

end
