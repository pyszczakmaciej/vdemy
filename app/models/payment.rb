class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :course


  enum :status, {pending: "pending", paid: "paid", failed: "failed"}

  def price_dollars
    price_cents / 100.0
  end
end
