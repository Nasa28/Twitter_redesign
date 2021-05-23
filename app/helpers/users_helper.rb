module UsersHelper
  def follow_btn(user)
    return unless signed_in?
    return if user == current_user
    if current_user.followed.pluck(:follower_id).include?(user.id)
      link_to unfollow_user_path(user) do
         fa_icon "times 2x ", class: "text-secondary"
         end
    else
      link_to follow_user_path(user) do
      fa_icon "plus-circle 2x", class: "text-secondary"
      end
    end
  end
end
