class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
      # use @user.errors.messages to put out a notice?
    end
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
