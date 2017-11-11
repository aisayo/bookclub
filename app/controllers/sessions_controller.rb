class SessionsController < ApplicationController

  def new
  end

  def create
    validate_login
  end

  def destroy
    log_out
  end

private

end
