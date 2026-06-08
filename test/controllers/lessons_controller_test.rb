require "test_helper"

class LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Attach a dummy file so the view doesn't crash on @lesson.file (uses if @lesson.file instead of file.attached?)
    [ lessons(:paid_lesson), lessons(:free_lesson) ].each do |lesson|
      tmp = Tempfile.new([ "test_video", ".mp4" ])
      tmp.write("fake video content")
      tmp.rewind
      lesson.file.attach(io: tmp, filename: "video.mp4", content_type: "video/mp4")
      tmp.close
    end
  end

  test "show redirects unauthenticated user" do
    get course_chapter_lesson_url(
      courses(:published_paid),
      chapters(:paid_chapter),
      lessons(:paid_lesson)
    )
    assert_redirected_to new_session_path
  end

  test "show allows enrolled user to view paid lesson" do
    sign_in_as(users(:one))
    get course_chapter_lesson_url(
      courses(:published_paid),
      chapters(:paid_chapter),
      lessons(:paid_lesson)
    )
    assert_response :success
  end

  test "show redirects non-enrolled user from paid lesson" do
    sign_in_as(users(:two))
    get course_chapter_lesson_url(
      courses(:published_paid),
      chapters(:paid_chapter),
      lessons(:paid_lesson)
    )
    assert_redirected_to discover_path(courses(:published_paid))
  end

  test "show allows non-enrolled user to view free lesson" do
    sign_in_as(users(:two))
    get course_chapter_lesson_url(
      courses(:published_free),
      chapters(:free_chapter),
      lessons(:free_lesson)
    )
    assert_response :success
  end
end
