require "test_helper"

class EnrollmentTest < ActiveSupport::TestCase
  test "belongs to user and course" do
    enrollment = enrollments(:one)
    assert_equal users(:one), enrollment.user
    assert_equal courses(:one), enrollment.course
  end
end
