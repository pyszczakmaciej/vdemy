class Admin::DashboardController < ApplicationController
  layout "admin"
  def index
    @courses = Course.all
    @students = User.where(role: :student).all
  end
end
