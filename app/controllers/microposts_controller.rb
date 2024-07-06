class MicropostsController < ApplicationController

  def index
    @posts = Micropost.all.page(params[:page])
  end

  def new
    @post = Micropost.new
  end

  def create
    @post = current_user.microposts.build(micropost_params)
    if @post.save
      redirect_to @post, notice: '投稿が作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Micropost.find(params[:id])
    debugger
  end

  def destroy
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
