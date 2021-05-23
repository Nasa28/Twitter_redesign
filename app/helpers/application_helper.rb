module ApplicationHelper
  def user_photo(user, size =10)
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

  def profile_photo(user)
     image_tag user_photo(user, 1000), class: "rounded-circle" if signed_in?
  end

  def background_image(user)
    link_to image_tag cover_photo(user, 1000), class: "cover_image" if signed_in?
  end

  def menu_photo(user)
    image_tag user_photo(user, 1000), class: "rounded" if signed_in?
 end
end
