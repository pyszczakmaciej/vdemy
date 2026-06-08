require "test_helper"

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  # courses(:one) and courses(:two) have no slug set in fixtures,
  # so to_param returns the integer ID — compatible with Course.find used in the controller
  test "create redirects unauthenticated user" do
    post course_enrollments_url(courses(:one))
    assert_redirected_to new_session_path
  end

  test "create enrolls user and redirects" do
    sign_in_as(users(:two))
    assert_difference "Enrollment.count", 1 do
      post course_enrollments_url(courses(:one))
    end
    assert_redirected_to discover_path(courses(:one))
  end

  test "create is idempotent — does not duplicate enrollment" do
    sign_in_as(users(:one))
    assert_no_difference "Enrollment.count" do
      post course_enrollments_url(courses(:one))
    end
    assert_redirected_to discover_path(courses(:one))
  end
end
