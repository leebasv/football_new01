class RemoveNationalityFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :nationality, :integer
  end
end
