class RemoveTeamIdFromScoreBets < ActiveRecord::Migration[5.2]
  def change
    remove_column :score_bets, :team_id, :integer
  end
end
