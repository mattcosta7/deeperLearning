class HomeController < ApplicationController

#if current_user go to that user, otherwise prep for new user
  def home
  	if current_user
      redirect_to current_user
    else
      @user = User.new
      render layout: 'app2'
  	end
  end

#admin panel available if user is admin.
  def admin
    if current_user.admin
      @courses = Course.all
    else
      redirect_to current_user
    end
  end
end
