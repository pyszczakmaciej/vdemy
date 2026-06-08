class AddPriceToPayments < ActiveRecord::Migration[8.1]
  def change
    add_column :payments, :price_cents, :integer
  end
end
