class CreateTelephones < ActiveRecord::Migration
  def self.up
    create_table :telephones, :force => true do |t|
      t.integer :telephone, :null => false
      t.belongs_to :entity
    end

    change_table :entities do |e|
      e.integer :main_telephone
    end
  end

  def self.down
    change_table :entities do |e|
      e.remove :main_telephone
    end

    drop_table :telephones
  end
end
