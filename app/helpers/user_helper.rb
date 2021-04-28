module UserHelper
  def put_name(user)
    user.each do |user|
      unless Friendship.reacted?(current_user.id, user.id)
        return user.name
        add_friend(user)
      end
    end
  end

  def add_friend(user)
    user.each do |user|
      if (signed_in? && !Friendship.reacted?(current_user.id, user.id) && current_user != user)
        return button_to "Add Friend", friendships_create_path(ids: { id1: current_user.id, id2: user.id })
      end
    end
  end
end
