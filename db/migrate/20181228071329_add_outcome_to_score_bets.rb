class AddOutcomeToScoreBets < ActiveRecord::Migration[5.2]
  def change
    add_column :score_bets, :outcome, :integer
  end
end
