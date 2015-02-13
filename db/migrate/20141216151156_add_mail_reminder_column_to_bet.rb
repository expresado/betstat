class AddMailReminderColumnToBet < ActiveRecord::Migration
  def change
  	add_column :bets, :lastMail, :datetime
  end
end
