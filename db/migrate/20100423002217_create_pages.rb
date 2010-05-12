class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.text :content
      t.string :permalink
      t.references :page_id, :default => nil
      t.boolean :static

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
