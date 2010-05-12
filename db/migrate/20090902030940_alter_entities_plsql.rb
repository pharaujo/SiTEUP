class AlterEntitiesPlsql < ActiveRecord::Migration
  def self.up
    execute 'ALTER TABLE ONLY entities ADD CONSTRAINT entity_nif_chk CHECK ((nif > 0))'
    execute 'ALTER TABLE ONLY entities ADD CONSTRAINT entity_nif_key UNIQUE (nif)'
    execute "COMMENT ON TABLE entities IS 'Saves existing entities.'"
  end

  def self.down
    execute 'ALTER TABLE ONLY entities DROP CONSTRAINT entity_nif_chk CASCADE'
    execute 'ALTER TABLE ONLY entities DROP CONSTRAINT entity_nif_key CASCADE'
    execute "COMMENT ON TABLE entities IS NULL"
  end
end
