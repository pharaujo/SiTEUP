class AlterEmailPlsql < ActiveRecord::Migration
  def self.up
    execute 'ALTER TABLE ONLY entities ADD CONSTRAINT entity_fk2 FOREIGN KEY (main_email) REFERENCES emails(id) ON DELETE SET NULL'
    execute 'ALTER TABLE ONLY emails ADD CONSTRAINT email_fk FOREIGN KEY (entity_id) REFERENCES entities(id) ON DELETE CASCADE'
    execute "ALTER TABLE ONLY emails ADD CONSTRAINT email_email_chk CHECK (((email)::text ~~ '%@%.%'::text))"
    execute "COMMENT ON TABLE emails IS 'Stores an entity`s email addresses.'"

    # TODO: add trigger here
    # execute File.new(File.join(File.dirname(__FILE__), '../scripts/email_trigger.sql')).read
  end

  def self.down
    execute 'ALTER TABLE ONLY entities DROP CONSTRAINT entity_fk2'
    execute 'ALTER TABLE ONLY emails DROP CONSTRAINT email_fk'
    execute "ALTER TABLE ONLY emails DROP CONSTRAINT email_email_chk"
    execute "COMMENT ON TABLE emails IS NULL"

    # TODO: do the same for the removal
    # execute "DROP TRIGGER t_insert_email ON emails CASCADE"
    # execute "DROP FUNCTION f_update_email_entidade() CASCADE"
  end
end
