module MessageHelper
  def get_other_users uid
    #User.where("NOT id = ?", uid)
    User.all - User.where(:id => uid)
  end
end
