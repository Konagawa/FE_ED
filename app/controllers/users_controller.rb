class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def show
    # 　Viewから与えられた引数をもとにUsersテーブルの該当レコードを検索し、変数に格納
    @user = User.find_by!(id_digest: params[:id])
  end

  def new
    #  Userクラスのオブジェクトを作成して、viewに渡す
    @user = User.new
  end

  def create
    #  多分ストロングパラメーター為に書いてるぽい、セキュリティかな
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = 'ログインしました。'
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by_id_digest(params[:id])
  end

  def update
    @user = User.find_by_id_digest(params[:id])
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    User.find_by_id_digest(params[:id]).destroy
    flash[:success] = "アカウントを削除しました。"
    redirect_to root_url, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
