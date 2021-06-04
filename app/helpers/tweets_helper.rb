module TweetsHelper
  def tweet_image(tweet)
    image_tag tweet.image if tweet.image.attached?
  end
end
