module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session[:user_id] = nil
    redirect_to '/', notice: 'You are logged out!'
  end

  def invalid_user
    flash.now[:danger] = 'Invalid username/password combination'
    render :new
  end

  def validate_login
    raise params.inspect
    user = User.find_by_username(session[:username])
    if user && user.authenticate(session[:password_digest])
      log_in(user)
      redirect_to user
    else
      invalid_user
    end
  end

end
