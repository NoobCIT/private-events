class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      current_user
      flash[:success] = "Congrats you signed up!"
      redirect_to @user
    else
      flash[:danger] = "Failed to sign up"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
