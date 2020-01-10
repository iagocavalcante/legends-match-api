class DislikeController < ApplicationController
  before_action :authenticate_user!

  def dislike
    unless User.find(params[:id])
      render json: { error: :not_found }
      return
    end

    current_user.update(dislikes: current_user.dislikes + [params[:id].to_i])

    render json: current_user
  end
end
