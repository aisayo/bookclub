module SessionsHelper

  def log_in(user)
    session[:id] = user.id
    #places a temp cookie on browser
    #contains encrypted id
    #can be used through browser until browser closed
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

end
