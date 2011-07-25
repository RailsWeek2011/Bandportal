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
end
