class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user
      return redirect_to login_path unless @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :'/users/new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end
