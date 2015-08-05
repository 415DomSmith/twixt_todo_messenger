class ChangePriorityToItems < ActiveRecord::Migration
  def change
  	change_column :items, :priority, 'integer USING CAST(priority AS integer)'
  end
end
