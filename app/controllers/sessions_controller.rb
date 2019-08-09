class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
    redirect_to user_path(current_user) if logged_in?
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user
      return redirect_to login_path, :flash => { alert: "Invalid password. Please try again." } unless @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path, :flash => { alert: "User not found. Please create a new account." }
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end
