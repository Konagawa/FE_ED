class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user
  #投稿一覧に順序をつける（ラムダ記法）
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def favorited_by?(user)
    favorited_by.include?(user)
  end
end
