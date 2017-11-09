class UsersController < ApplicationController

  def index #lists all users
    @users = User.all
  end

  def show #individual users profile page
    @user = User.find_by(id: params[:id])
  end

  def new #make new user/signup
    #should render sign up form
    #redirects to users show page
  end

end
