class AddFareToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :fare, :Integer
  end
end
