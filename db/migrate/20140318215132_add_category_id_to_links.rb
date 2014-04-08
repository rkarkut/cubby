class AddCategoryIdToLinks < ActiveRecord::Migration
  def change

    add_column :links, :category_id, :integer, after: :user_id
  end
end
