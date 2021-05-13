class TweetsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show new]
  def index
  end

  def new
    @tweet = current_user.tweets.build(tweet_params)
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash.now[:notice] = "Tweet created successfully"
      redirect_to root_path
    else
      render :new

    end
  end

  private

  def tweet_params 
    params.require(:tweet).permit(:text, :author_id)
  end
end
