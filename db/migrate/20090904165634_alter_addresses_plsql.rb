class AlterAddressesPlsql < ActiveRecord::Migration
  def self.up
    execute 'ALTER TABLE ONLY entities ADD CONSTRAINT entity_fk3 FOREIGN KEY (main_address) REFERENCES addresses(id) ON DELETE SET NULL'
    execute 'ALTER TABLE ONLY addresses ADD CONSTRAINT address_fk FOREIGN KEY (entity_id) REFERENCES entities(id) ON DELETE CASCADE'
    #execute "ALTER TABLE ONLY moradas ADD CONSTRAINT morada_codpostal_chk CHECK (((codigo_postal)::text ~~ '____-___'::text))"
    execute "COMMENT ON TABLE addresses IS 'Stores an entitie`s addresses.'"

    # TODO: add trigger here
  end

  def self.down
    execute 'ALTER TABLE ONLY entities DROP CONSTRAINT entity_fk3'
    execute 'ALTER TABLE ONLY addresses DROP CONSTRAINT address_fk'
    #execute "ALTER TABLE ONLY moradas DROP CONSTRAINT morada_codpostal_chk"
    execute "COMMENT ON TABLE addresses IS NULL"

    # TODO: do the same for the removals
  end
end
