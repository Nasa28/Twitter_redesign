class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @tweet = Tweet.new
    @pagy, @tweets = pagy(Tweet.user_tweets, items: 8)
    @pagy_follow, @users = pagy(User.all_users(current_user.id).order('created_at DESC'), items: 8)
    @follow_list = current_user.followed.pluck(:follower_id)
  end

  def show; end

  def new
    @tweet = current_user.tweets.build
  end

  def edit; end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    @tweet.image.attach(params[:tweet][:image])
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:text, :image)
  end
end
