class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.datetime :match_date
      t.integer :team_id1
      t.integer :team_id2
      t.integer :time
      t.integer :extra_time1
      t.integer :extra_time2
      t.integer :status

      t.timestamps
    end
    add_index :matches, :team_id1
    add_index :matches, :team_id2
    add_index :matches, [:team_id1, :team_id2], unique: true
  end
end
