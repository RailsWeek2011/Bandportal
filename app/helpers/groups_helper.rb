module GroupsHelper
  def is_registered? u
     u.class == User
  end
end
