class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :journey_id
      t.integer :user_id
      t.integer :route_id
      t.string :DOB

      t.timestamps null: false
    end
  end
end
