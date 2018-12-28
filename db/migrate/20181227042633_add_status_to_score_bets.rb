class AddStatusToScoreBets < ActiveRecord::Migration[5.2]
  def change
    add_column :score_bets, :status, :integer
  end
end
