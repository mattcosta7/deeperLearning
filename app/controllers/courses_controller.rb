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
        flash[:notice]= "Saved"
        redirect_to courses_path
      else
        flash[:notice]= "error"
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
      flash[:notice]="That don't exist, doofus"
      redirect_to courses_path
    end
  end

#if user is admin, destroys course, else redirects
  def destroy
    if current_user.admin
      @course = Course.find(params[:id])
      if @course.destroy
        flash[:notice]="Destroyed the course.....Duh Erin"
        redirect_to courses_path
      else
        flash[:notice]="Fiddled but didn't destroy"
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
        flash[:notice]= "Saved"
        redirect_to @course
      else
        flash[:notice]= "error"
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
