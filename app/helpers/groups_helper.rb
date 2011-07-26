module GroupsHelper
  def is_registered? u
     u.class == User
  end

  def is_artist_group? g
    g.groupable_type == 'ArtistGroup'
  end

  def get_instruments uid, gid
    m = Membership.where "userable_id = ? AND group_id = ?", uid, gid
    ret = Array.new
    m.each do |e|
      ret << e.instruments
    end

    return ret
  end

  def user_in_group? uid, gid
    g = Group.find gid

    g.members.each do |m|
      if m.id == uid
        return true
      end
    end

    return false
  end

  def get_groups_of_user uid
    groups = Array.new

    memberships = Membership.where "userable_id = ? AND userable_type = 'User'", uid

    memberships.each do |m|
      groups << Group.find(m.group_id)
    end

    return groups
  end
end
