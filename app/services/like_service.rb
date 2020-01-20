class LikeService
  def initialize(current_user, params)
    @current_user = current_user
    @params = params
  end

  def execute
    return false unless valid_params?

    @current_user.update(likes: @current_user.likes + [@params[:id].to_i])
    check_match
  end

  def valid?
    valid_params?
  end

  private

  def valid_params?
    @current_user.present? &&
        @params.present? && @params[:id].present? &&
        User.exists?(@params[:id])
  end

  def check_match
    if User.find(@params[:id]).likes.include?(@current_user.id)
      ActionCable.server.broadcast(
          "match_#{@current_user.id}",
          @current_user
      )

      ActionCable.server.broadcast(
          "match__#{@params[:id]}",
          User.find(@params[:id])
      )
    end
  end

end