class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username,           null: false
      t.string :email,              null: false
      t.string :encrypted_password, null: false
      t.string :password_salt,      null: false
      t.string :persistence_token,  null: false

      t.timestamps null: false
    end

    add_index :users, :email
  end

  def self.down
    drop_table :users
  end
end
