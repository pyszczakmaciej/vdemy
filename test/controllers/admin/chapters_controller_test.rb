require "test_helper"

class Admin::ChaptersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as(users(:admin))
    @course = courses(:one)
    @chapter = chapters(:one)
  end

  test "create redirects unauthenticated user" do
    sign_out
    post admin_course_chapters_url(@course), params: { chapter: { title: "New Chapter" } }
    assert_redirected_to new_session_path
  end

  test "create adds chapter to course and redirects" do
    assert_difference "Chapter.count", 1 do
      post admin_course_chapters_url(@course), params: { chapter: { title: "New Chapter" } }
    end
    assert_redirected_to edit_admin_course_path(@course)
  end

  test "update modifies chapter and redirects" do
    patch admin_course_chapter_url(@course, @chapter), params: { chapter: { title: "Updated" } }
    assert_redirected_to edit_admin_course_path(@course)
    assert_equal "Updated", @chapter.reload.title
  end

  test "destroy deletes chapter and redirects" do
    assert_difference "Chapter.count", -1 do
      delete admin_course_chapter_url(@course, @chapter)
    end
    assert_redirected_to edit_admin_course_path(@course)
  end
end
