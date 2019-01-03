class AddNationToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :nation, :string
  end
end
