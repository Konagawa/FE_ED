class UsersController < ApplicationController # rubocop:disable Layout/EndOfLine,Style/Documentation
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

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
