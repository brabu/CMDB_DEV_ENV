class ChangeDateFromJourney < ActiveRecord::Migration
  def change
  	change_column :journeys, :date,  :date
  end
end
