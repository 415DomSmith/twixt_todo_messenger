class AddColumnListIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :list_id, :integer
  end
end
