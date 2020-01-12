class LikeController < ApplicationController
  before_action :authenticate_user!

  def like
    like = LikeService.new(current_user, params)
    if like.valid?
      like.execute

      render json: {message: "Liked with successfully"}, status: :ok
    else
      render json: {message: "Deu ruim"}, status: 422
    end
  end
end