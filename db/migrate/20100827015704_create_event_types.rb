class CreateEventTypes < ActiveRecord::Migration
  def self.up
    create_table :event_types do |t|
      t.string :description
    end
  end

  def self.down
    drop_table :event_types
  end
end
