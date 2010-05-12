class AlterEntityTypesPlsql < ActiveRecord::Migration
  def self.up
    execute 'ALTER TABLE ONLY entities ADD CONSTRAINT entities_fk FOREIGN KEY (entity_type_id) REFERENCES entity_types(id) ON DELETE RESTRICT'
    execute "COMMENT ON TABLE entity_types IS 'Stores the entity types that exist.'"
  end

  def self.down
    execute 'ALTER TABLE ONLY entities DROP CONSTRAINT entities_fk'
    execute "COMMENT ON TABLE entity_types IS NULL"
  end
end
