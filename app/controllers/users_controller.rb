class UsersController < ApplicationController

  def index #lists all users
    #only signed up/logged in users can see
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "You're all signed up!"
      redirect_to @user
    else
      render "new"
    #submits forms
    #validates params
    #creates a new user
    end
  end

  def show #individual users profile page
    @user = User.find_by(id: params[:id])
  end


  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
