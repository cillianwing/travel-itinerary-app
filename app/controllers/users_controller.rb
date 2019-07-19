class UsersController < ApplicationController
  before_action :set_user!, only: [:index, :show, :edit, :update, :destroy]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to 'index'
    else
      render :new
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
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user!
    @user = User.find(params[:id])
  end

end
