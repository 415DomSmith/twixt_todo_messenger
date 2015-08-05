class SetDefaultForUserPermissions < ActiveRecord::Migration
  def change
  	change_column :users, :is_admin, :boolean, :default => false
  	change_column :users, :is_owner, :boolean, :default => false
  end
end
