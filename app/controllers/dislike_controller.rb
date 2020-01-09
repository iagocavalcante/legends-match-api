class DislikeController < ApplicationController
  before_action :authenticate_user!

  def like
    liked_id = params[:id]
    authenticated_id = current_user.id
    
    user_disliked = User.find(liked_id)

    if !user_disliked
      render json: { 'error': :not_found }
    end

    if current_user.dislikes.empty?
      current_user.dislikes = [user_disliked.id]
    else
      current_user.dislikes.push(user_disliked.id)
    end
    
    current_user.save

    render json: current_user
  end
end
