module UserHelper
  def user_accept
    return 'successfully logged in' if current_user signed_in?
  end
end
