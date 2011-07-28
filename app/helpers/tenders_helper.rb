module TendersHelper
  def get_sup_group_artist agid
    Group.where(:groupable_type => 'ArtistGroup', :groupable_id => agid).first
  end

  def user_is_host_tender? uid, tid
    t = Tender.find(tid)
    e = Event.find(t.event_id)
    g = Group.where(:groupable_type => 'HostGroup', :groupable_id => e.host_group_id).first
    m = Membership.where(:userable_type => 'User', :userable_id => uid, :group_id => g.id)

    if m.empty?
      return false
    else
      return true
    end
  end
end
