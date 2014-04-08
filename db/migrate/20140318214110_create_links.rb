class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.text :description
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
