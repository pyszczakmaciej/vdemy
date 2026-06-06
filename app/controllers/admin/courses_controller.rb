class Admin::CoursesController < ApplicationController
  layout "admin"
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  def index
    @courses = Course.all
  end

  def show
  end

  def edit
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.instructor = current_user

    if @course.save
      redirect_to admin_courses_path, notice: "Course successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @course.update(course_params)
      redirect_to admin_courses_path, notice: 'Course was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @course.destroy
      redirect_to admin_courses_path, notice: "Course successfully deleted"
    else
      redirect_to admin_courses_path, notice: "Course could not be deleted"
    end
  end

  private

  def set_course
    @course = Course.includes(:chapters).friendly.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :subtitle, :level, :category, :price, :free, :published)
  end
end
