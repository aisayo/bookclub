class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        redirect_to user
      else
        flash.now[:danger] = 'Invalid username/password combination'
        render :new
    end
  end

  # def create
  #   if auth = request.env["omniauth.auth"]
  #     @user = User.find_or_create_by_omniauth(auth)
  #     session[:user_id] = @user.id
  #     redirect_to user_path
  #   else
  #     user = User.find_by_username(params[:session][:username])
  #     if user && user.authenticate(params[:password])
  #       session[:user_id] = user.id
  #       redirect_to user_path
  #     else
  #       render :new
  #     end
  #   end
  # end

  #getting this error: URL blocked: This redirect failed because the redirect URI is not white-listed in the app's client OAuth settings. Make sure that the client and web OAuth logins are on and add all your app domains as valid OAuth redirect URIs.

  def destroy
    log_out
  end

private

  def auth
    request.env['omniauth.auth']
  end

end


#flash.now is specifically designed for displaying flash messages on rendered pages
