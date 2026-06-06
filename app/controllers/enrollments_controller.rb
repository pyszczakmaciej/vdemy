class EnrollmentsController < ApplicationController

  def create
    @course = Course.includes(:chapters, :lessons).find(params[:course_id])

    current_user.enrollments.find_or_create_by!(course: @course)

    first_chapter = @course.chapters.first
    first_lesson = first_chapter.lessons.first

    if first_chapter && first_lesson
      redirect_to discover_path(@course), notice: "Enrolled successfully"
    else
      redirect_to discover_path(@course), notice: "Enrollment, lessons not found.."
    end

  end
end
