class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweet =Tweet.new
    @my_tweet = @tweet.author
    @tweets = Tweet.all
    @users = User.all
  end
  def update
      if @user.update(user_params)
  
      else
        render :edit
    end
  end

private
  def user_params
    params.require(:tweet).permit(:photo, :cover_image)
  end
end
