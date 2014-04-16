class CreateFavorites < ActiveRecord::Migration
  def change
    add_column :links, :favorite, :integer, :null => false, :default => 0 
  end
end
