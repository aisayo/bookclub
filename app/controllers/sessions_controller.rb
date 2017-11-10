class SessionsController < ApplicationController

  def new
  end

  def create
      validate_login
  end

  # def create_facebook
  #   @user = User.find_or_create_by(uid: auth['uid']) do |u|
  #     u.username = auth['info']['name']
  #     u.email = auth['info']['email']
  #   end
  #     session[:user_id] = @user.id
  #     redirect_to user_path
  # end

  def destroy
    log_out
  end

private

  def auth
    request.env['omniauth.auth']
  end

end


#flash.now is specifically designed for displaying flash messages on rendered pages
