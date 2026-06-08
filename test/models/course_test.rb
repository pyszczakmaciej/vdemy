require "test_helper"

class CourseTest < ActiveSupport::TestCase
  test "display_price returns Free for free course" do
    course = courses(:published_free)
    assert_equal "Free", course.display_price
  end

  test "display_price returns dollar amount for paid course" do
    course = courses(:published_paid)
    assert_equal "$29", course.display_price
  end

  test "published scope returns only published courses" do
    published = Course.published
    assert published.all?(&:published?)
    assert_includes published, courses(:published_paid)
    assert_not_includes published, courses(:one)
  end

  test "generates slug from title" do
    course = courses(:published_paid)
    assert_equal "advanced-python", course.slug
  end
end
