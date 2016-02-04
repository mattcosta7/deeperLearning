class HomeController < ApplicationController
  def home
  	if current_user
  		@user = current_user
      redirect_to current_user
    else
      @user = User.new
  	end
  end

  def admin
    if current_user.admin
      @courses = Course.all
    else
      redirect_to current_user
    end
  end
end
