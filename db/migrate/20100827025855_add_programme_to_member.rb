class AddProgrammeToMember < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.belongs_to :programme
    end
  end

  def self.down
    change_table :members do |t|
      t.remove :programme
    end
  end
end
