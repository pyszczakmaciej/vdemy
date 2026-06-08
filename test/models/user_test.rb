require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "downcases and strips email_address" do
    user = User.new(email_address: " DOWNCASED@EXAMPLE.COM ")
    assert_equal "downcased@example.com", user.email_address
  end

  test "default role is student" do
    user = User.new(email_address: "new@example.com", password: "password")
    assert user.student?
  end

  test "role can be set to admin" do
    user = users(:admin)
    assert user.admin?
  end
end
