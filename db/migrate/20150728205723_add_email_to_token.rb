class AddEmailToToken < ActiveRecord::Migration
  def change
    add_column :tokens, :email, :string
  end
end
