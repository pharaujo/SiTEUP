class CreateEntities < ActiveRecord::Migration
  def self.up
    create_table :entities, :force => true do |e|
      e.string :name, :null => false
      e.string :homepage
      e.integer :nif
    end
  end

  def self.down
    drop_table :entities
  end
end
