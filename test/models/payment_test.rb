require "test_helper"

class PaymentTest < ActiveSupport::TestCase
  test "price_dollars converts cents to dollars" do
    payment = payments(:one)
    assert_equal 9.99, payment.price_dollars
  end

  test "status enum has expected values" do
    assert payments(:one).pending?
    assert payments(:two).paid?
  end
end
