require "test_helper"

class DiscoverControllerTest < ActionDispatch::IntegrationTest
  test "index redirects unauthenticated user" do
    get discover_index_url
    assert_redirected_to new_session_path
  end

  test "index returns success" do
    sign_in_as(users(:two))
    get discover_index_url
    assert_response :success
  end

  test "index shows only published courses" do
    sign_in_as(users(:two))
    get discover_index_url
    assert_select "body", text: /Advanced Python/
    assert_select "body", text: /Intro to HTML/
  end

  test "index filters by category" do
    sign_in_as(users(:two))
    get discover_index_url, params: { category: "programming" }
    assert_response :success
  end

  test "index excludes enrolled courses for logged-in user" do
    sign_in_as(users(:one))
    get discover_index_url
    assert_response :success
    # user :one is enrolled in published_paid — should not see it
    assert_select "body", text: /Advanced Python/, count: 0
  end

  test "show returns success" do
    sign_in_as(users(:one))
    get discover_url(courses(:published_paid))
    assert_response :success
  end
end
