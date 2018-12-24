class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :new, index: true, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
