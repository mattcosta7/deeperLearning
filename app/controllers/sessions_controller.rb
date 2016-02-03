class SessionsController < ApplicationController
  def create
    params.inspect
    @user = User.where(email: params[:session][:email]).first
    if @user && @user.authenticate(params[:password])
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
