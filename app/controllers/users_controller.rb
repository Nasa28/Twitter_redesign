class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @tweet =Tweet.new
    @my_tweet = @tweet.author
    @tweets = Tweet.all
    @users = User.all
  end

  def follow_user
    user = User.find(params[:id])
    follow = Following.create(followed_id:current_user.id, follower_id: user.id)
    if follow.save
      flash[:notice] = "You are now follwoing #{user.username}"
      redirect_to user_path(user)
    end
    
  end
  def unfollow_user
    user = User.find(params[:id])
    unfollow = Following.find_by(followed: current_user)
    unfollow.destroy
      flash[:notice] = "You unfollowed #{user.username}"
      redirect_to user_path(user)
    end

    
end
