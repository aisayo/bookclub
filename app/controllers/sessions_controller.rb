class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    validate_login
  end

  def oauth
    user = User.find_or_create_by_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    log_out
  end

protected

  def auth
    request.env['omniauth.auth']
  end

  private

  def session_params
    params.require(:user).permit(:username, :email, :password_confirmation, :uid, :password)
  end


end
