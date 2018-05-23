module SessionsHelper
  
  #渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  #ログアウト
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  #現在のユーザーを返す
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #ユーザーがログインしていればtrueを返す
  def logged_in? 
    !current_user.nil?
  end
end
