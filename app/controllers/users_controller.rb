class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweet =Tweet.new
    @my_tweet = @tweet.author
    @tweets = Tweet.all
    @users = User.all
  end

  def follow_user(user)
    User.find(params[:id])
    current_user.follow(user)
    if current_user.following?(user)
      flash[:notice] = "You are now following #{user.username}"

    else flash.now[:alert] = "Try again"
    end
  end

  def unfollow_user(user)
    User.find(params[:id])
    current_user.unfollow(user)
    if !current_user.following?(user)
      flash[:notice] = "You have unfollowed #{user.username}"

    else flash.now[:alert] = "Try again"
    end
  end
end
