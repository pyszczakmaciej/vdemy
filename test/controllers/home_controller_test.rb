require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "redirects unauthenticated user" do
    get root_url
    assert_redirected_to new_session_path
  end

  test "returns success for authenticated user" do
    sign_in_as(users(:one))
    get root_url
    assert_response :success
  end
end
