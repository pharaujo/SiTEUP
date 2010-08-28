class CreateAvailabilities < ActiveRecord::Migration
  def self.up
    create_table :availabilities do |t|
      t.belongs_to :member
      t.belongs_to :event
      t.text :notes
      t.boolean :go
      t.timestamps
    end
  end
  
  def self.down
    drop_table :availabilities
  end
end
