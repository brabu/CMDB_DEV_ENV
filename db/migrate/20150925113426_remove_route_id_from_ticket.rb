class RemoveRouteIdFromTicket < ActiveRecord::Migration
  def change
    remove_column :tickets, :route_id, :integer
  end
end
