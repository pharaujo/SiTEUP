class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails, :force => true do |e|
      e.string :email, :null => false
      e.belongs_to :entity
    end

    change_table :entities do |e|
      e.integer :main_email
    end
  end

  def self.down
    change_table :entities do |e|
      e.remove :main_email
    end

    drop_table :emails
  end
end
