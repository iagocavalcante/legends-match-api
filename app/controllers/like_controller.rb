class LikeController < ApplicationController
  before_action :authenticate_user!

  def like
    unless User.find(params[:id])
      render json: { error: :not_found }
      return
    end

    current_user.update(likes: current_user.likes + [params[:id].to_i])

    check_match
  end

  private

  def check_match
    if User.find(params[:id]).likes.include?(current_user.id)
      ActionCable.server.broadcast(
        "match_#{current_user.id}",
        current_user
      )

      ActionCable.server.broadcast(
        "match__#{params[:id]}",
        User.find(params[:id])
      )
    end
  end
end
