class MicropostsController < ApplicationController
before_action :set_params, only: [:show, :edit, :destroy, :update]

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
  end

  private

  def set_params
    @post = Micropost.find(params[:id])
  end

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
