class AddNewEventStuffd < ActiveRecord::Migration
  def change
	remove_column :bets, :user_id
  end
end
