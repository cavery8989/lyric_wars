class CreateBattleResults < ActiveRecord::Migration
  def change
    create_table :battle_results do |t|
      t.string :winner
      t.string :looser
      t.string :round_one_sum
      t.string :round_two_sum
      t.string :round_three_sum
      t.timestamps null: true
    end
  end
end
