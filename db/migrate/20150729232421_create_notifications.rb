class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :item_id
      t.string :message
      t.string :phone
      t.string :recemail
      t.datetime :send_by

      t.timestamps null: true
    end
  end
end
