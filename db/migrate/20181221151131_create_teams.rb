class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :league_id
      t.integer :stadium_id
      t.boolean :nationality
      t.date :date_start
      t.string :short_name
      t.string :coach

      t.timestamps
    end
  end
end
