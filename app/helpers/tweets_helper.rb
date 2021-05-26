module TweetsHelper
  def tweet_image
    image_tag tweet.image if @tweet.image.attached?
  end
end
