class UsersController < ApplicationController

  def index #lists all users
    #only signed up/logged in users can see
    @users = User.all
  end

  def new #make new user/signup
    #should render sign up form
    #redirects to users show page
  end

  def show #individual users profile page
    @user = User.find_by(id: params[:id])
  end


  def create
    #submits forms
    #validates params
    #creates a new user
  end

end
