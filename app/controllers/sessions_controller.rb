class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to user
      else
        flash.now[:danger] = 'Invalid username/password combination'
        render :new
    end
  end

  def destroy
    log_out
  end

end


#flash.now is specifically designed for displaying flash messages on rendered pages
