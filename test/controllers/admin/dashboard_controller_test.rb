require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "index redirects unauthenticated user" do
    get admin_root_url
    assert_redirected_to new_session_path
  end

  test "index returns success for authenticated user" do
    sign_in_as(users(:admin))
    get admin_root_url
    assert_response :success
  end
end
