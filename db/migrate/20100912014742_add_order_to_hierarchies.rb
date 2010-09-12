class AddOrderToHierarchies < ActiveRecord::Migration
  def self.up
    change_table :hierarchies do |t|
      t.integer :position
    end
  end

  def self.down
    change_table :hierarchies do |t|
      t.remove :position
    end
  end
end
