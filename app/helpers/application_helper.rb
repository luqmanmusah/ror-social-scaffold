module ApplicationHelper
  # rubocop: disable Style/GuardClause
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def add_friend(user)
    if signed_in? && !Friendship.reacted?(current_user.id, user.id) && current_user != user
      button_to 'Add Friend',
                friendships_create_path(ids: { id1: current_user.id, id2: user.id })
    end
  end

  def un_friend(user)
    if user == current_user
      content_tag(:ul) do
        user.friends.each do |friend|
          concat content_tag(:li, (button_to 'Unfriend',
                                             friendships_destroy_path(friendship_id: Friendship.find_friendship(
                                               @user.id, friend.id
                                             ))) + friend.name.to_s)
        end
      end
    end
  end

  def accept(user)
    if user == current_user
      content_tag(:ul) do
        user.friend_requests.each do |friendship|
          concat content_tag(:li, (button_to 'Accept',
                                             friendships_update_path(friendship_id: friendship.id)) + (button_to 'Reject',
                                                                                                                 friendships_destroy_path(friendship_id: friendship.id)) +
                                  "#{User.find(friendship.user_id).name} Wants to be your friend")
        end
      end
    end
  end
end

# rubocop: enable Style/GuardClause
