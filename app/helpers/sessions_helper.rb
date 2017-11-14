module SessionsHelper

  def validate_login
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render :new
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
    redirect_to '/', notice: 'You are logged out!'
  end
  
end
