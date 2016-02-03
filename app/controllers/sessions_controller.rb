class SessionsController < ApplicationController
  def create
    @user = User.where(email: params[:email]).first
    if @user
      session[:user_id] = @user.user_id
      flash[:notice] = "Signed in"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Sign In Failed"
      redirect_to :back
    end
  end

  def new
    @user = User.new
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
