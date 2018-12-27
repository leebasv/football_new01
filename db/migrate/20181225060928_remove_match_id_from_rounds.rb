class RemoveMatchIdFromRounds < ActiveRecord::Migration[5.2]
  def change
    remove_column :rounds, :match_id, :int
  end
end
