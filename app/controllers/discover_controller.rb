class DiscoverController < ApplicationController
  def index
    @courses = Course.published
    @categories = Course::CATEGORY_LABELS.keys

    if params[:category].present? && @categories.include?(params[:category])
      @courses = @courses.where(category: params[:category])
    end
  end

  def show
    @course = Course.find(params[:id])
  end
end
