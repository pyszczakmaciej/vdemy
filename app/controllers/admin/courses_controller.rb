class Admin::CoursesController < ApplicationController
  layout "admin"
  def index
    @courses = Course.all
  end

  def show
  end

  def edit
    @course = Course.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
