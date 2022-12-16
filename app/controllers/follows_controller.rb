# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    current_user.follow(params[:format])
    redirect_to user_url(params[:format])
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to user_url(params[:id])
  end
end
