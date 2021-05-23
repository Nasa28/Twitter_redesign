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
  def alert_me
    result = ' '
    if notice.present?
      result += '<div class="alert alert-info" role="alert">'
      result += '<p>'
      result += notice
      result += '</p>'
      result += '</div>'
    end
    if alert.present?
      result += '<div class="alert alert-danger" role="alert">'
      result += '<p>'
      result += alert
      result += '</p>'
      result += '</div>'
    end
    result.html_safe
  end
end
