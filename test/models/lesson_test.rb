require "test_helper"

class LessonTest < ActiveSupport::TestCase
  test "belongs to chapter" do
    lesson = lessons(:one)
    assert_equal chapters(:one), lesson.chapter
  end

  test "acceptable_file rejects unsupported content type" do
    lesson = lessons(:one)
    lesson.file.attach(
      io: StringIO.new("fake content"),
      filename: "document.pdf",
      content_type: "application/pdf"
    )
    assert_not lesson.valid?
    assert_includes lesson.errors[:file], "must be an image (jpg, jpeg, png) or mp4"
  end

  test "acceptable_file allows mp4" do
    lesson = lessons(:one)
    lesson.file.attach(
      io: StringIO.new("fake video"),
      filename: "video.mp4",
      content_type: "video/mp4"
    )
    assert lesson.valid?
  end
end
