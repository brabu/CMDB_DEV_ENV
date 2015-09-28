class ChangeStAndEtFromRoute < ActiveRecord::Migration
  def change
  	change_column :routes, :st,  :time
  	change_column :routes, :et,  :time
  end
end
