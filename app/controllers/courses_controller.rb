class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
  end

  def show
    @course = Course.find(params[:id])
  end

  def destroy
  end

  def update
  end
end
