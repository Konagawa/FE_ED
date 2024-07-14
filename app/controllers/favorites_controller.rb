class FavoritesController < ApplicationController

  def create
    @post = Micropost.find(params[:micropost_id])
    favorite = current_user.favorites.build(micropost_id: @post.id)
    respond_to do |format|
      if favorite.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("post_#{@post.id}", partial: 'microposts/favorite', locals: { post: @post })
        end
      else
        format.html { redirect_to @post, alert: 'お気に入り登録に失敗しました'}
      end
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(micropost: params[:micropost_id])
    @post = Micropost.find(params[:micropost_id])
    respond_to do |format|
      if favorite.destroy
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("post_#{@post.id}", partial: 'microposts/favorite', locals: { post: @post })
        end
      else
        format.html { redirect_to @post, alert: 'お気に入り解除に失敗しました'}
      end
    end
  end
end
