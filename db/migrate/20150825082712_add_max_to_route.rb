class AddMaxToRoute < ActiveRecord::Migration
  def change
    add_column :routes, :max, :integer
  end
end
