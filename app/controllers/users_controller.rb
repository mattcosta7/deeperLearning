class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        console.log("Erin is better than Matt.")
      else
        consolelog("Matt is not as cool as Erin.")
      end
  end

  def edit
  end

  def show
    @user = current_user
    @users = User.all
  end

  def destroy
  end

  def edit
  end

  def user_params
    params.require(:user).permit(:name, :password_digest, :location, :birthday, :hobbies, :email)
  end

  def update
  end
end
