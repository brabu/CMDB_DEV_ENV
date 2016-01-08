class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :journey_id
      t.integer :user_id
      t.timestamps null: false
      t.index [:user_id]
    end
  end
end
