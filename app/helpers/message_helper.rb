module MessageHelper
  def get_other_users uid
    #User.where("NOT id = ?", uid)
    User.order(:nick) - User.where(:id => uid)
  end
end
