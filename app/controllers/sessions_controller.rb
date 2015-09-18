class SessionsController < ApplicationController
  def new
  end

  def create
    pass = params[:session][:password] + "banana"
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(pass)
      log_in user
      user.remember
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent[:remember_token] = user.remember_token
      redirect_to user
    else
      flash.now[:danger] = "Error, email/password combination is invalid. "
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    cookies.delete :remember_token
    cookies.delete :user_id
    @current_user = nil
    redirect_to root_path
  end
end
