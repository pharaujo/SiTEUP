class AddMemberIdToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |u|
      u.belongs_to :member
    end
  end

  def self.down
    change_table :users do |u|
      u.remove :member_id
    end
  end
end
