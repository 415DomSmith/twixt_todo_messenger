class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :complete, :default => false
      t.date :created
      t.string :priority
      t.string :image_url
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
