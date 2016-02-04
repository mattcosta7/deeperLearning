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
        flash[:alert] = "Erin is better than Matt."
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:alert] = "Matt is not as cool as Erin."
      end
  end

  def edit
    @user = User.find_by_name(params[:id])
  end

  def update
    puts params.inspect
    @user = User.find_by_name(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice]="Updated"
      redirect_to @user
    else
      flash[:notice]="Not happenin"
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


end
