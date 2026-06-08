class LessonsController < ApplicationController
  before_action :set_course
  before_action :set_chapter
  before_action :set_lesson
  def show
    @enrolled = current_user.enrollments.exists?(course: @course)
    unless @enrolled || @course.free?
      redirect_to discover_path(@course), alert: "You don't have enrolled"
    end
  end


  private

  def set_course
    @course = Course.friendly.find(params[:course_id])
  end

  def set_chapter
    @chapter = @course.chapters.friendly.find(params[:chapter_id])
  end

  def set_lesson
    @lesson = @chapter.lessons.friendly.find(params[:id])
  end
end
