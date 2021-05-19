module ApplicationHelper

  def user_avatar (user, size =40)
    if user.photo.attached?
      user.photo.variant(resize: "#{size}x#{size}!")
    else
      gravatar_image_url(user.email, size: size)
    end
  end
end
