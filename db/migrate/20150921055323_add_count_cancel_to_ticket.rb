class AddCountCancelToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :count_cancel, :integer
  end
end
