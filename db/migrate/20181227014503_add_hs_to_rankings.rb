class AddHsToRankings < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :hs, :integer
  end
end
