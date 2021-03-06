class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @tweet = Tweet.new
    @pagy, @tweets = pagy(Tweet.all.order('created_at DESC'), items: 8)
    @pagy_follow, @users = pagy(User.all_users(current_user.id).order('created_at DESC'), items: 8)
    @follows = @user.followers.includes(:followed)
  end

  def follow_user
    user = User.find(params[:id])
    follow = Following.create(followed_id: current_user.id, follower_id: user.id)
    flash[:notice] = "You are now following #{user.username}"
    redirect_to user_path(user) if follow.save
  end

  def unfollow_user
    user = User.find(params[:id])
    unfollow = Following.find_by(followed: current_user)
    unfollow.destroy
    flash[:notice] = "You unfollowed #{user.username}"
    redirect_to user_path(user)
  end
end
