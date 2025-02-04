class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  validates :user_id, presence: true
  validates :micropost_id, presence: true
  validates :user_id, uniqueness: { scope: :micropost_id, message: "has already favorited this post" }
end
