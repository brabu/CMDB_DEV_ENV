class AddCountToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :count, :integer
  end
end
