module SessionsHelper
  #rails定義メソッドのsessionを使ってcookiesに暗号化したユーザーIDが作成される
  def log_in(user)
    session[:user_id_digest] = user.id_digest
  end

    # 現在ログイン中のユーザーを返す（いる場合）
  def current_user
    @current_user ||= User.find_by(id_digest: session[:user_id]) if session[:user_id]
  end

  #  ログインしていればtrue,その他ならfalseを返す。
  def logged_in?
    !current_user.nil?
  end

  def log_out
    reset_session
    @current_user = nil
  end
end
