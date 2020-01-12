class DislikeController < ApplicationController
  before_action :authenticate_user!

  def dislike
    dislike = DislikeService.new(current_user, params)
    if dislike.valid?
      dislike.execute

      render json: {user: current_user, message: "Desliked with successfully"}, status: :ok
    else
      render json: {message: "Deu ruim"}, status: 422
    end
  end
end
