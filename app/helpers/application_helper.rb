module ApplicationHelper
  include Pagy::Frontend
  def user_photo(user, size = 30)
    if user.photo.attached?
      user.photo.variant(resize: "#{size}x#{size}!").processed
    else
      gravatar_image_url(user.email, size: size)
    end
  end

  def cover_photo(user, size = 800)
    if user.cover_image.attached?
      user.cover_image.variant(resize: "#{size}x#{size}")
    else
      gravatar_image_url(user.email, size: size)
    end
  end

  def profile_photo(user)
    image_tag user_photo(user, 1000), class: 'rounded-circle'
  end

  def background_image(user)
    link_to image_tag cover_photo(user, 1000), class: 'cover_image'
  end

  def menu_photo(user)
    image_tag user_photo(user, 1000), class: 'rounded'
  end

  def who_to_follow(user)
    result = ' '
    unless @follow_list.include?(user.id)
      result += '<div class = "justify-content-around mt-2 align-items-center">'
      result += profile_photo(user)
      result += link_to user.full_name.split.map(&:capitalize) * ' ',
                        user_path(user), class: 'text-decoration-none fw-bold p-3'
    end
    result.html_safe
  end

  def nav
    render partial: 'layouts/navbar' unless signed_in?
  end
end
