class AddCounterToLinks < ActiveRecord::Migration
  def change
    add_column :links, :counter, :integer, :null => false, :default => 0 
  end
end
