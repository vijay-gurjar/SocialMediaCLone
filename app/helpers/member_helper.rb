module MemberHelper
  def ban_status(user)
    if member.access_locked?
      'Activate'
    else
      'Deactivate'
    end
  end
  def resource_name
    :member
  end

  def resource
    @resource ||= Member.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:member]
  end
end
