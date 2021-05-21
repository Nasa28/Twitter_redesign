module ApplicationHelper
  def user_photo(user, size =50)
    if user.photo.attached?
      user.photo.variant(resize: "#{size}x#{size}!")
    else
      gravatar_image_url(user.email, size: size)
    end
  end

  def cover_photo(user, size =800)
    if user.cover_image.attached?
      user.cover_image.variant(resize: "#{size}x#{size}")
    else
      gravatar_image_url(user.email, size: size)
    end
  end
end
