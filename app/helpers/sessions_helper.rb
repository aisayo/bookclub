module SessionsHelper

  def log_in(user)
    session[:id] = user.id
    #places a temp cookie on browser
    #contains encrypted id
    #can be used through browser until browser closed
  end
end
