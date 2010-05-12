class MembersPlsql < ActiveRecord::Migration
  def self.up
    # execute 'ALTER TABLE ONLY membros ADD CONSTRAINT membros_id_key UNIQUE (id)'
    execute 'ALTER TABLE ONLY members ADD CONSTRAINT member_nbi_key UNIQUE (nbi)'
    execute 'ALTER TABLE ONLY members ADD CONSTRAINT member_student_number_key UNIQUE (student_number)'
    execute 'ALTER TABLE ONLY members ADD CONSTRAINT member_godfather_chk CHECK ((id <> godfather_id))'
    # execute 'ALTER TABLE ONLY membros ADD CONSTRAINT membro_fk FOREIGN KEY (id) REFERENCES entidades(id) ON DELETE CASCADE'
    execute 'ALTER TABLE ONLY members ADD CONSTRAINT member_fk FOREIGN KEY (entity_id) REFERENCES entities(id) ON DELETE CASCADE'
    execute 'ALTER TABLE ONLY members ADD CONSTRAINT member_fk1 FOREIGN KEY (godfather_id) REFERENCES members(id) ON DELETE SET NULL'
    execute "COMMENT ON TABLE members IS 'Stores member information.'"
  end

  def self.down
    execute 'ALTER TABLE ONLY members DROP CONSTRAINT member_nbi_key'
    execute 'ALTER TABLE ONLY members DROP CONSTRAINT member_student_number_key'
    execute 'ALTER TABLE ONLY members DROP CONSTRAINT member_godfather_chk'
    execute 'ALTER TABLE ONLY members DROP CONSTRAINT member_fk'
    execute 'ALTER TABLE ONLY members DROP CONSTRAINT member_fk1'
    execute "COMMENT ON TABLE members IS NULL"
  end
end
