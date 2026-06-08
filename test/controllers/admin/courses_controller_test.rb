require "test_helper"

class Admin::CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as(users(:admin))
    @course = courses(:one)
  end

  test "index redirects unauthenticated user" do
    sign_out
    get admin_courses_url
    assert_redirected_to new_session_path
  end

  test "index returns success" do
    get admin_courses_url
    assert_response :success
  end

  test "show returns success" do
    get admin_course_url(@course)
    assert_response :success
  end

  test "new returns success" do
    get new_admin_course_url
    assert_response :success
  end

  test "create with valid params creates course and redirects" do
    assert_difference "Course.count", 1 do
      post admin_courses_url, params: {
        course: { title: "New Course", subtitle: "Sub", price: 9.99, free: false,
                  published: false, category: "programming", level: "beginner" }
      }
    end
    assert_redirected_to admin_courses_path
  end

  # No model-level validations on Course — skipping invalid params test

  test "edit returns success" do
    get edit_admin_course_url(@course)
    assert_response :success
  end

  test "update with valid params updates course and redirects" do
    patch admin_course_url(@course), params: {
      course: { title: "Updated Title" }
    }
    assert_redirected_to admin_courses_path
    assert_equal "Updated Title", @course.reload.title
  end

  test "destroy deletes course and redirects" do
    # courses(:one) has payments — use published_free which has none
    assert_difference "Course.count", -1 do
      delete admin_course_url(courses(:published_free))
    end
    assert_redirected_to admin_courses_path
  end
end
