module EventsHelper
  def get_sup_group id
    Group.where("groupable_type = 'HostGroup' AND groupable_id = ?", id).first
  end

  def user_is_host? uid, gid
    m = Membership.where("userable_type = 'User' AND userable_id = ? AND group_id = ?", uid, gid)
    if m.empty?
      return false
    else
      return true
    end
  end

  def get_unadded_artist_groups exitsting_groups
    Group.where("groupable_type = 'ArtistGroup'") - exitsting_groups
  end
end
