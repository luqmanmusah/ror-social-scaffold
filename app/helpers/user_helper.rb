module UserHelper
  def user_accept
    if current_user signed_in?
      return "successfully logged in"
    end
  end
end
