class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @u = User.new
  end

  def show
    @u = User.find(params[:id])
  end

  def create
    @u = User.new(user_params)
    if @u.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @u
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
