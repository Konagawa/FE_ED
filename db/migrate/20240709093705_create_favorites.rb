class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.bigint :user_id
      t.bigint :micropost_id

      t.timestamps
    end
  end
end
