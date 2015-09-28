class RemoveDobFromTicket < ActiveRecord::Migration
  def change
    remove_column :tickets, :DOB, :string
  end
end
