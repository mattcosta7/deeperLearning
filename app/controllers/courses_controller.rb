class CoursesController < ApplicationController
 
#array of courses set to @courses
  def index
    @courses = Course.all
  end

#if current user is admin, makes new course, else redirect
  def new
    if current_user.admin
      @course = Course.new
    else
      redirect_to current_user
    end
  end

#if current user is admin, prep to edit course, else redirect
  def edit
    if current_user.admin
      @course = Course.find(params[:id])
    else
      redirect_to current_user
    end
  end

#if current user is admin update course, else redirect
  def create
    if current_user.admin
      @course = Course.new(course_params)
      if @course.save
       flash[:success] = "Wahoo! You've successfully created a new course."
        redirect_to courses_path
      else
        flash[:fail] = "Aw, Squid! Something went wrong. Please try again."
        redirect_to :back
      end
    else
      redirect_to current_user
    end
  end

#sets course and challenges 
  def show
    if Course.exists?(params[:id])
      @course = Course.find(params[:id])
      @challenges = @course.challenges
    else
      flash[:notice]="That doesn't exist, doofus. This should also never be seen."
      redirect_to courses_path
    end
  end

#if user is admin, destroys course, else redirects
  def destroy
    if current_user.admin
      @course = Course.find(params[:id])
      if @course.destroy
        flash[:success] = "Wahoo! You've successfully deleted a course."
        redirect_to courses_path
      else
        flash[:fail] = "Aw, Squid! Something went wrong. Please try again."
        redirect_to :back
      end
    else
      redirect_to current_user
    end
  end

#
  def update
    if current_user.admin
      @course = Course.find(params[:id])
      if @course.update_attributes(course_params)
        flash[:success] = "Wahoo! You've successfully updated your account."
        redirect_to admin_path
      else
        flash[:fail] = "Aw, Squid! Something went wrong. Please try again."
        redirect_to :back
      end
    else
      redirect_to current_user
    end
  end

  private
  def course_params
    params.require(:course).permit(:name,:icon)
  end
end
