class AlterTelephonesPlsql < ActiveRecord::Migration
  def self.up
    execute 'ALTER TABLE ONLY entities ADD CONSTRAINT entity_fk1 FOREIGN KEY (main_telephone) REFERENCES telephones(id) ON DELETE SET NULL'
    execute 'ALTER TABLE ONLY telephones ADD CONSTRAINT telephone_fk FOREIGN KEY (entity_id) REFERENCES entities(id) ON DELETE CASCADE'
    execute "COMMENT ON TABLE telephones IS 'Stores a telephone number'"

    # TODO: add trigger here
  end

  def self.down
    execute 'ALTER TABLE ONLY entities DROP CONSTRAINT entity_fk1'
    execute 'ALTER TABLE ONLY telephones DROP CONSTRAINT telephone_fk'
    execute "COMMENT ON TABLE telephones IS NULL"

    # TODO: do the same for the removal
  end
end
