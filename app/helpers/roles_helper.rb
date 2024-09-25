module RolesHelper
  ROLE_PERMISSIONS = {
    approve: ["super_admin", "admin"],
    create:  ["super_admin", "admin", "worker"],
    edit:    ["super_admin", "admin", "worker"],
    read:    ["super_admin", "admin", "worker", "read_only"],
    delete:  ["super_admin", "admin", "worker"]
  }.freeze

  def role_has_permission?(role, action)
    ROLE_PERMISSIONS[action].include?(role)
  end

  def can_approve?(role)
    role_has_permission?(role, :approve)
  end

  def can_create?(role)
    #false
    role_has_permission?(role, :create)
  end

  def can_edit?(role)
    #false
    role_has_permission?(role, :edit)
  end

  #def can_read?(role)
   #role_has_permission?(role, :read)
  #end

  def can_delete?(role)
    #false
    role_has_permission?(role, :delete)
  end
end
