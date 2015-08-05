class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.boolean :is_admin, :default => false
      t.boolean :is_owner, :default => false
      t.string :avatar

      t.timestamps null: false
    end
  end
end
