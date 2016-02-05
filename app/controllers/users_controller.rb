class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        flash[:alert] = "Erin is not remotely better than Matt."
        session[:user_id] = @user.id
        flash[:awesome]="Fill Out Some Info, so we can better assist you in your Epic Adventure"
        redirect_to edit_user_path(@user)
      else
        flash[:alert] = "Erin is a failure!"
        redirect_to :back
      end
  end

  def edit
    @user = User.find_by_name(params[:id])
  end

  def update
    @user = User.find_by_name(params[:id])
    if @user == current_user && @user.authenticate(params[:user][:password])
      if @user.update_attributes(edit_params)
        flash[:notice]="Updated"
        redirect_to @user
      else
        flash[:notice]="Not happenin"
        redirect_to :back
      end
    else
      flash[:notice]="Incorrect Password"
      redirect_to :back
    end
  end

  def show
    @user = User.find_by_name(params[:id])
  end



  def destroy
  end


  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :location, :birthday, :hobbies, :email,:avatar)
  end

  def edit_params
    params.require(:user).permit(:name, :location, :birthday, :hobbies, :email,:avatar)
  end

end
