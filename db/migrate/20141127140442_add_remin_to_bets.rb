class AddReminToBets < ActiveRecord::Migration
  def change
  	add_column :bets, :remind, :boolean
  end
end
