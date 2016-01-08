class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.integer :routeid
      t.date :date
      t.integer :booked

      t.timestamps null: false
    end
  end
end
