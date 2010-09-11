class CreateHierarchies < ActiveRecord::Migration
  def self.up
    create_table :hierarchies do |t|
      t.string :description
    end
  end
  
  def self.down
    drop_table :hierarchies
  end
end
