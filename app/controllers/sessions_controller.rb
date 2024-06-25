class SessionsController < ApplicationController
  def new
  end

  def create
    #User.find_byメソッドはアクティブレコードが提供
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      #判定後、セッション情報をリセットし、再セットする。セキュリティの為
      reset_session
      log_in @user
      redirect_to @user
    else
      flash[:denger] = "メールアドレス又は、パスワードが正しくありません。"
      render 'new', status: :unprocessable_entity
    end
  end


  def destroy
    log_out
    redirect_to root_url, status: :see_other
  end
end
