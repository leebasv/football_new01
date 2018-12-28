class AddUserToScoreBets < ActiveRecord::Migration[5.2]
  def change
    add_reference :score_bets, :user, foreign_key: true
  end
end
