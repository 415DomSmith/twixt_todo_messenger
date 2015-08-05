class SetDefaultForItemsComplete < ActiveRecord::Migration
	def change
  	change_column :items, :complete, :boolean, :default => false
  end
end
