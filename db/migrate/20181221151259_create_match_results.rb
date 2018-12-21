class CreateMatchResults < ActiveRecord::Migration[5.2]
  def change
    create_table :match_results do |t|
      t.references :match, index: true, foreign_key: true
      t.integer :team_id1
      t.integer :team_id2
      t.integer :score1
      t.integer :score2

      t.timestamps
    end
    add_index :match_results, :team_id1, unique: true
    add_index :match_results, :team_id2, unique: true
  end
end
