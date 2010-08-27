class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.timestamp :start_date
      t.timestamp :end_date
      t.string :local
      t.text :notes
      t.float :revenue
      t.boolean :paid
      t.boolean :confirmed
      t.boolean :public
      t.belongs_to :event_type
      t.belongs_to :entity
      t.timestamps
    end
  end
  
  def self.down
    drop_table :events
  end
end
