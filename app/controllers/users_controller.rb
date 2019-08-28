class UsersController < ApplicationController
  before_action :require_login, only: [:index, :show, :edit, :update, :destroy]

  def index
    @user = current_user
    @upcoming_trips = @user.trips.upcoming_trips
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    if current_user.id != params[:id].to_i
      redirect_to users_path, alert: "You cannot view another user's profile."
    end
    @past_trips = @user.trips.past_trips
    @upcoming_trips = @user.trips.upcoming_trips
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def past
    @past_trips = current_user.trips.past_trips
    flash.now[:alert] = "You do not have any past trips." if @past_trips.size == 0
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :biography, :location, :email, :password, :password_confirmation)
  end

end
