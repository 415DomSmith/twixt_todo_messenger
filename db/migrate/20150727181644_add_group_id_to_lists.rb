class AddGroupIdToLists < ActiveRecord::Migration
  def change
    add_column :lists, :group_id, :integer
  end
end
