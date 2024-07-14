class AddForeignKeysToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :favorites, :users
    add_foreign_key :favorites, :microposts
    add_index :favorites, [:user_id, :micropost_id], unique: true
  end
end
