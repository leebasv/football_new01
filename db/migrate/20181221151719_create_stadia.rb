class CreateStadia < ActiveRecord::Migration[5.2]
  def change
    create_table :stadia do |t|
      t.string :name
      t.integer :capacity
      t.string :nation
      t.string :continent
      t.string :location

      t.timestamps
    end
  end
end
