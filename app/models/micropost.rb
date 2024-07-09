class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  #投稿一覧に順序をつける（ラムダ記法）
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
