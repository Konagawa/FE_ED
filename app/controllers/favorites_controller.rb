class FavoritesController < ApplicationController

   def create
    @micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(@micropost)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @micropost }
    end
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(@micropost)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @micropost }
    end
  end
end
