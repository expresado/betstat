class AddMailFrequency < ActiveRecord::Migration
  def change
  	add_column :users, :mailFrequency, :integer
  end
end
