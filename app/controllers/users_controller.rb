class UsersController < ApplicationController
  def show
    @tweet =Tweet.new
     @tweets = Tweet.all
    @user = User.find(params[:id])
  end
end
