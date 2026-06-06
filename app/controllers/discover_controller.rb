class DiscoverController < ApplicationController
  def index
    @courses = Course.all.where(published: true)
  end
end
