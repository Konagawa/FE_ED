class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :corrent_user,   only: [:edit, :update]

  def show
    # 　Viewから与えられた引数をもとにUsersテーブルの該当レコードを検索し、変数に格納
    @user = User.find(params[:id])
  end

  def new
    #  Userクラスのオブジェクトを作成して、viewに渡す
    @user = User.new
  end

  def create
    #  多分ストロングパラメーター為に書いてるぽい、セキュリティかな
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ログインしました。'
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url, status: :see_other
    end
  end

  def corrent_user
    @user = User.find(params[:id])
    redirect_to(root_url, status: :see_other) unless @user == current_user
  end
end
