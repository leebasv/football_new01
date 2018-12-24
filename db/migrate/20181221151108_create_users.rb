class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.string :activation_digest
      t.boolean :activated
      t.datetime :activated_at
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.boolean :admin
      t.float :money

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :reset_digest, unique: true
    add_index :users, :activation_digest, unique: true
  end
end
