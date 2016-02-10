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

#find a mentor page, if current_user then they an view people near their location
#markers hash gets built for each of these users, to place markers in google maps
  def tutor
    if current_user
      @users = User.near(current_user.location, 50,:order => "distance")
      @hash = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.title user.name
      end
    else
      redirect_to root_path
    end
  end

end
