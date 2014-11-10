class AddGainColumnToBets < ActiveRecord::Migration
  def change
	add_column :bets, :gain, :float
  end
end
