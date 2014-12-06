class AddReminderToBets < ActiveRecord::Migration
  def change
  	add_column :bets, :reminder, :datetime
  end
end
