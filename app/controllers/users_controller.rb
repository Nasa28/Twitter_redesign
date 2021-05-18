class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweet =Tweet.new
    @tweets = Tweet.all
  end
end
