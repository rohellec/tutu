class AddPassengerToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :passenger, :string
  end
end
