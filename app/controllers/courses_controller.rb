class CoursesController < ApplicationController
  def index
    @courses = current_user.enrolled_courses
    @categories = Course::CATEGORY_LABELS.keys
    @category = @categories.first

    if params[:category].present? && @categories.include?(params[:category])
      @courses = @courses.where(category: params[:category])
      @category = params[:category]
    end
  end
end
