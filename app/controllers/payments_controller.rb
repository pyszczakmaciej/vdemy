class PaymentsController < ApplicationController
  def create
    @course = Course.friendly.find(params[:course_id])

    stripe_session = Stripe::Checkout::Session.create(
      mode: "payment",
      payment_method_types: [ "card" ],
      line_items: [
        {
          price_data: {
            currency: "usd",
            unit_amount: (@course.price * 100).to_i,
            product_data: {
              name: @course.title
            }
          },
          quantity: 1
        }
      ],
      customer_email: current_user.email_address,
      metadata: { course_id: @course.id, user_id: current_user.id },
      success_url: success_payments_url(course_id: @course.id) + "&session_id={CHECKOUT_SESSION_ID}",
    )

    current_user.payments.create(
      course: @course,
      stripe_session_id: stripe_session.id,
      price_cents: (@course.price * 100).to_i,
      status: :pending,
    )

    redirect_to stripe_session.url, allow_other_host: true
  end

  def success
    stripe_session = Stripe::Checkout::Session.retrieve(params[:session_id])

    if stripe_session.payment_status == "paid"
      payment = Payment.find_by(stripe_session_id: params[:session_id])

      ActiveRecord::Base.transaction do
        payment.update!(status: :paid)
        current_user.enrollments.find_or_create_by!(course: payment.course)
      end
      first_chapter = payment.course.chapters.order(:position).first
      first_lesson = first_chapter.lessons.order(:position).first
      redirect_to course_chapter_lesson_path(payment.course, first_chapter, first_lesson), notice: "Purchase successful"

    else
      redirect_to root_path, notice: "Purchase not completed. Try again"
    end

  rescue Stripe::InvalidRequestError => e
    redirect_to root_path, notice: e.message
  end
end
