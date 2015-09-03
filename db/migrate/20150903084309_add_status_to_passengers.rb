class AddStatusToPassengers < ActiveRecord::Migration
  def change
    add_column :passengers, :status, :boolean
  end
end
