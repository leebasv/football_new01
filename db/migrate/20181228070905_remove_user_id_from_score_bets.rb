class RemoveUserIdFromScoreBets < ActiveRecord::Migration[5.2]
  def change
    remove_column :score_bets, :user_id, :integer
  end
end
