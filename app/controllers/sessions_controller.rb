class SessionsController < ApplicationController

#create a session, where user is the one of that email, authenticate
#password, if some items aren't filled in try to get that info
# else go to that users view
  def create
    @user = User.where(email: params[:session][:email]).first
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Signed in"
      if(@user.birthday == nil || @user.hobbies == nil || @user.location == nil)
        flash[:awesome]="Fill Out Some Info, so we can better assist you in your Bogus Journey"
        redirect_to edit_user_path(@user)
      else
        redirect_to user_path(@user)
      end
    else
      flash[:notice] = "Sign In Failed"
      redirect_to :back
    end
  end

#preps for new session
  def new
    @user = User.new
  end

#destroys session and goes to root on logout
  def destroy
    session.clear
    redirect_to root_path
  end
end
