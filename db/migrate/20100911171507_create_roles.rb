class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.timestamp :start_date
      t.timestamp :end_date
      t.belongs_to :member
      t.belongs_to :role_type
      t.timestamps
    end
  end
  
  def self.down
    drop_table :roles
  end
end
