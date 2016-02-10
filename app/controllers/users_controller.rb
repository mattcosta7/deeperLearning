class UsersController < ApplicationController
#all users set to @users
  def index
    @users = User.all
  end

#sets a new user up
  def new
    @user = User.new
  end

#creates a user with user params
  def create
    @user = User.create(user_params)
      if @user.save
        flash[:success] = "Wahoo! You've successfully created an account"
        session[:user_id] = @user.id
        flash[:awesome]="Fill Out Some Info, so we can better assist you in your Epic Adventure"
        redirect_to edit_user_path(@user)
      else
        flash[:fail] = "Aw, Squid! Something went wrong. Please try again."
        redirect_to :back
      end
  end

#preps edit a user form by their name params
  def edit
    @user = User.find_by_name(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end

#updates a user by newly passed in params, if that's the current user and 
#it's authenticated
  def update
    @user = User.find_by_name(params[:id])
    if @user == current_user && @user.authenticate(params[:user][:password])
      if @user.update_attributes(edit_params)
        flash[:success] = "Wahoo! You've successfully updated your account."
        redirect_to @user
      else
        flash[:fail] = "Aw, Squid! Something went wrong. Please try again."
        redirect_to :back
      end
    else
      flash[:fail] = "Aw, Squid! That's the wrong password."
      redirect_to :back
    end
  end

#shows a user
  def show
    if User.exists?(name:params[:id])
      @user = User.find_by_name(params[:id])
    else
      flash[:notice]="This should never be seen."
      redirect_to root_path
    end
  end


#destorys a user if they are the current one, and they type their password
  def destroy
    @user = User.find_by_name(params[:id])
    if current_user == @user && @user.authenticate(params[:user][:password])
      if @user.destroy
        flash[:missyou] = "We hope to seeal you again soon."
        session.clear
        redirect_to root_path
      else
        flash[:fail] = "Aw, Squid! Something went wrong. Please try again."
        redirect_to :back
      end
    end
  end

#params for creating and editing users
  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :location, :birthday, :hobbies, :email,:avatar)
  end

  def edit_params
    params.require(:user).permit(:name, :location, :birthday, :hobbies, :email,:avatar)
  end

end
