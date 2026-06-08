class AddStatusAndSessionIdToPayments < ActiveRecord::Migration[8.1]
  def change
    add_column :payments, :stripe_session_id, :string
    add_column :payments, :status, :string
  end
end
