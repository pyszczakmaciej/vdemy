class Admin::ChaptersController < ApplicationController
  before_action :set_course
  before_action :set_chapter, only: [ :update, :destroy ]
  def new
  end

  def create
    @chapter = @course.chapters.build(chapter_params)

    @chapter.position = @course.chapters.count

    if @chapter.save
      redirect_to edit_admin_course_path(@course), notice: "Chapter created"
    else
      redirect_to edit_admin_course_path(@course), notice: "Chapter could not be created"
    end
  end

  def update
    if @chapter.update(chapter_params)
      redirect_to edit_admin_course_path(@course), notice: "Chapter updated"
    else
      redirect_to edit_admin_course_path(@course), notice: "Chapter could not be updated"
    end
  end

  def destroy
    if @chapter.destroy
      redirect_to edit_admin_course_path(@course), notice: "Chapter deleted"
    else
      redirect_to edit_admin_course_path(@course), notice: "Chapter could not be deleted"
    end
  end


  private

  def set_course
    @course = Course.friendly.find(params[:course_id])
  end

  def set_chapter
    @chapter = @course.chapters.friendly.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title)
  end
end
