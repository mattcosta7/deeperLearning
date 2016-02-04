class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    if current_user.admin
      @course = Course.new
    else
      redirect_to current_user
    end
  end

  def edit
    if current_user.admin
      @course = Course.find(params[:id])
    else
      redirect_to current_user
    end
  end

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

  def show
    @course = Course.find(params[:id])
    @challenges = @course.challenges
  end

  def destroy
    @course = Course.find(params[:id])
  end

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
    params.require(:course).permit(:name)
  end
end
