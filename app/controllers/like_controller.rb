class LikeController < ApplicationController
  before_action :authenticate_user!

  def like
    liked_id = params[:id]
    authenticated_id = current_user.id
    
    user_liked = User.find(liked_id)

    if !user_liked
      render json: { 'error': :not_found }
    end

    if current_user.likes.empty?
      current_user.likes = [user_liked.id]
    else
      current_user.likes.push(user_liked.id)
    end
    
    current_user.save
    
    if user_liked.likes.include?(authenticated_id)
      logger.debug "Match gostoso! #{authenticated_id} com #{user_liked.id}"
    end

    render json: current_user
  end
end
