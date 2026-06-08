class Admin::LessonsController < ApplicationController
  layout "admin"
  before_action :set_course
  before_action :set_chapter
  before_action :set_lesson, only: [ :show, :edit, :update, :destroy ]
  def edit
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = @chapter.lessons.build(lesson_params)
    @lesson.position = @chapter.lessons.count

    if @lesson.save
      redirect_to edit_admin_course_path(@course), notice: "Lesson was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to admin_course_chapter_path(@course, @chapter), notice: "Lesson was successfully updated."
    else
      redirect_to :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :duration, :file)
  end

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
