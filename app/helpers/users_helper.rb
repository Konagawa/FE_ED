module UsersHelper


  private
    def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url, status: :see_other
    end
  end

  def correct_user
    @user = User.find_by_id_digest(params[:id])
    redirect_to(root_url, status: :see_other) unless @user == current_user
  end

end
