class UsersController < ApplicationController

  def index #lists all users
    @users = User.all
  end

  def show #individual users page
  end

  def new #make new user/signup
  end

end
