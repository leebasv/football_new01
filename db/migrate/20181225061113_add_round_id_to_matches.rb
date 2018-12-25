class AddRoundIdToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :round_id, :int
  end
end
