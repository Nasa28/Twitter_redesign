module TweetsHelper
  def tweet_image
    if @tweet.image.attached?
    image_tag tweet.image
    end
  end
end
