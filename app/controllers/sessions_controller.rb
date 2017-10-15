class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in(user)
      flash[:success] = "You successfully logged in"
      redirect_to root_url
    else
      flash[:danger] = "You need to sign up first!"
      redirect_to root_url
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end

end
