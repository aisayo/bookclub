class UsersController < ApplicationController

  def index #lists all users
    #only signed up/logged in users can see
    @users = User.all
  end

  def new #make new user/signup
    #should render sign up form
    #redirects to users show page
    @user = User.new
  end

  def show #individual users profile page
    @user = User.find_by(id: params[:id])
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You're all signed up!"
      redirect_to @user
    else
      render "new"
    #submits forms
    #validates params
    #creates a new user
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
