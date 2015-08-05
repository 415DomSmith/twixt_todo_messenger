class AddNameToToken < ActiveRecord::Migration
  def change
    add_column :tokens, :first_name, :string
    add_column :tokens, :last_name, :string
    add_column :tokens, :image, :string
    add_column :tokens, :full_name, :string
    add_column :tokens, :google_profile, :string
  end
end
