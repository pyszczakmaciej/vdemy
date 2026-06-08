require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  test "index redirects unauthenticated user" do
    get courses_url
    assert_redirected_to new_session_path
  end

  test "index returns success for authenticated user" do
    sign_in_as(users(:one))
    get courses_url
    assert_response :success
  end

  test "index filters by category" do
    sign_in_as(users(:one))
    get courses_url, params: { category: "programming" }
    assert_response :success
  end
end
