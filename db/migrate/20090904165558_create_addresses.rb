class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :address, :null => false
      t.string :zipcode, :limit => 8
      t.string :city
      t.references :entity
    end

    change_table :entities do |e|
      e.integer :main_address
    end
  end

  def self.down
    change_table :entities do |e|
      e.remove :main_address
    end
    
    drop_table :addresses
  end
end
