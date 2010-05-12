class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :nickname, :null => false
      t.string :student_number, :limit => 9
      t.integer :nbi
      t.integer :godfather_id
      t.references :entity
    end
  end

  def self.down
    drop_table :members
  end
end
