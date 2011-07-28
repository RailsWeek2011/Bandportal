module CandidaturesHelper
  def get_users_artist_groups uid
    Group.where(:groupable_type => 'ArtistGroup').joins(:memberships).where(:memberships => {:userable_type => 'User', :userable_id => uid})
  end

  def get_sup_artist_group agid
    Group.where(:groupable_type => 'ArtistGroup', :groupable_id => agid).first
  end
end
