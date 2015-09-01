class AddPassengerIdToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :passenger_id, :Integer
  end
end
