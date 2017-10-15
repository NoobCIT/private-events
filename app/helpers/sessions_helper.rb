module SessionsHelper

  #Logs in given user
  def log_in(user)
    session[:user_id] = user.id
  end

  #Sets current user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if logged in
  def logged_in?
    !current_user.nil?
  end

  # Logs user out
  def logout
    session.delete(:user_id)
    session.clear
    @current_user = nil
  end
end
