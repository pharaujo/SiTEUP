class CreateEntityTypes < ActiveRecord::Migration
  def self.up
    create_table :entity_types, :force => true do |e|
      e.string :description, :null => false
    end

    change_table :entities do |e|
      e.belongs_to :entity_type
    end
  end

  def self.down
    drop_table :entity_types

    change_table :entities do |e|
      e.remove :entity_type_id
    end
  end
end
