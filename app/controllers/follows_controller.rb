# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to user_url(params[:user_id])
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to user_url(params[:id])
  end
end
