class AddNewEventStuff < ActiveRecord::Migration
  def change
	add_column :bets, :user_id, :string
  end
end
