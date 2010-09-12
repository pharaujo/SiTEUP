class AddActiveToMember < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.boolean :active
    end
  end

  def self.down
    change_table :members do |t|
      t.remove :active
    end
  end
end
