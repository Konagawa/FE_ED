class MicropostsController < ApplicationController
before_action :set_params, only: [:show, :edit, :destroy, :update]
before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  def index
    @posts = Micropost.page(params[:page])
  end

  def new
    @post = Micropost.new
  end

  def create
    @post = current_user.microposts.build(micropost_params)
    if @post.save
      redirect_to @post, notice: '投稿が作成されました。'
    else
      flash.now[:alert] = '投稿に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(micropost_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to @post
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    flash.notice = "投稿を削除しました。"
    redirect_to microposts_url

  end

  private

  def set_params
    @post = Micropost.find(params[:id])
  end

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
