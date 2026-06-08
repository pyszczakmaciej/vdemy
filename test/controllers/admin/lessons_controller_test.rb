require "test_helper"

class Admin::LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as(users(:admin))
    @course = courses(:one)
    @chapter = chapters(:one)
    @lesson = lessons(:one)
  end

  test "new redirects unauthenticated user" do
    sign_out
    get new_admin_course_chapter_lesson_url(@course, @chapter)
    assert_redirected_to new_session_path
  end

  test "new returns success" do
    get new_admin_course_chapter_lesson_url(@course, @chapter)
    assert_response :success
  end

  test "create adds lesson to chapter and redirects" do
    assert_difference "Lesson.count", 1 do
      post admin_course_chapter_lessons_url(@course, @chapter), params: {
        lesson: { title: "New Lesson", duration: "5:00" }
      }
    end
    assert_redirected_to edit_admin_course_path(@course)
  end

  test "show returns success" do
    get admin_course_chapter_lesson_url(@course, @chapter, @lesson)
    assert_response :success
  end

  test "edit returns success" do
    get edit_admin_course_chapter_lesson_url(@course, @chapter, @lesson)
    assert_response :success
  end

  test "update modifies lesson and redirects" do
    patch admin_course_chapter_lesson_url(@course, @chapter, @lesson), params: {
      lesson: { title: "Updated Lesson", duration: "10:00" }
    }
    assert_redirected_to admin_course_chapter_path(@course, @chapter)
    assert_equal "Updated Lesson", @lesson.reload.title
  end
end
