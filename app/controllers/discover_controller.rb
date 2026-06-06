class DiscoverController < ApplicationController
  def index
    @courses = Course.published
    @categories = Course::CATEGORY_LABELS.keys

    if current_user && current_user.enrolled_course_ids.any?
      @courses = @courses.where.not(id: current_user.enrolled_course_ids)
    end

    if params[:category].present? && @categories.include?(params[:category])
      @courses = @courses.where(category: params[:category])
    end
  end

  def show
    @course = Course.find(params[:id])
  end
end
