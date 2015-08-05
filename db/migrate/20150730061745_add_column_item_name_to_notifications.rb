class AddColumnItemNameToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :item_name, :string
  end
end
