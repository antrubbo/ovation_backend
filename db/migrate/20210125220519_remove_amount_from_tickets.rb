class RemoveAmountFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :amount, :integer
  end
end
