# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    current_user.follow(params[:id])
    redirect_to user_url(params[:id])
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to user_url(params[:id])
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
end
