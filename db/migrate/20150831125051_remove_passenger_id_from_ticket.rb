class RemovePassengerIdFromTicket < ActiveRecord::Migration
  def change
    remove_column :tickets, :passsenger_id, :integer
  end
end
