class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :sid
      t.integer :did
      t.string :st
      t.string :et
      t.integer :fare

      t.timestamps null: false
    end
  end
end
