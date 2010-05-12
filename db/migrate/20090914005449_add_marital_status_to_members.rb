class AddMaritalStatusToMembers < ActiveRecord::Migration
  def self.up
    change_table :members do |m|
      m.string :marital_status, :default => 'S'
    end
  end

  def self.down
    change_table :members do |m|
      m.remove :marital_status
    end
  end
end
