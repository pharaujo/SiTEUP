class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :member

  named_scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }

  ROLES = %w[admin reporter humanrelations scheduler]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  
  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? } + member.try(:roles_array).to_a
  end
  
  def role_symbols
    roles.map(&:to_sym)
  end

  def role?(name)
    role_symbols.include?(name.to_sym)
  end

end
