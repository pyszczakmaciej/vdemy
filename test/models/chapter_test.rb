require "test_helper"

class ChapterTest < ActiveSupport::TestCase
  test "belongs to course" do
    chapter = chapters(:one)
    assert_equal courses(:one), chapter.course
  end

  test "generates slug from title on save" do
    chapter = Chapter.create!(title: "My New Chapter", course: courses(:one))
    assert_equal "my-new-chapter", chapter.slug
  end
end
