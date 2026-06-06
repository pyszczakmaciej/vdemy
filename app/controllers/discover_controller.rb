class DiscoverController < ApplicationController
  def index
    @courses = Course.all.where(published: true)
  end

  def show
    @course = Course.find(params[:id])
  end
end
