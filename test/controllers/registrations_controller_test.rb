require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "new returns success" do
    get sign_up_url
    assert_response :success
  end

  test "create with valid params creates user and redirects" do
    assert_difference "User.count", 1 do
      post sign_up_create_url, params: {
        user: { email_address: "newuser@example.com", password: "password" }
      }
    end
    assert_redirected_to root_path
  end
end
