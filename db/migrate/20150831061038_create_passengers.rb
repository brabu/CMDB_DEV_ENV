class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.integer :ticket_id
      t.string :name
      t.integer :age

      t.timestamps null: false
    end
  end
end
