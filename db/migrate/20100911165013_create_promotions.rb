class CreatePromotions < ActiveRecord::Migration
  def self.up
    create_table :promotions do |t|
      t.timestamp :time
      t.integer :order
      t.string :name
      t.belongs_to :member
      t.belongs_to :hierarchy
      t.timestamps
    end
  end
  
  def self.down
    drop_table :promotions
  end
end
