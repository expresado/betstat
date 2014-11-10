class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.string :match
      t.float :course
      t.float :bet
      t.boolean :result

      t.timestamps
    end
  end
end
