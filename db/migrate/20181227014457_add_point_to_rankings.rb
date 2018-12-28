class AddPointToRankings < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :point, :integer
  end
end
