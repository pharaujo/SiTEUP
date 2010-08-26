class EntityType < ActiveRecord::Base
  has_many :entities

  # TODO: improve the condition so it can be more general
  #
  public
  def self.only_member
    first(:conditions => 
      ["description = ? OR description = ?", "Membro", "Member"])
  end

  def self.except_members
    all(:conditions => 
      ["description <> ? AND description <> ?", "Membro", "Member"])
  end
end
