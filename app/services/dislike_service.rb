class DislikeService
  def initialize(current_user, params)
    @current_user = current_user
    @params = params
  end

  def execute
    return false unless valid_params?

    @current_user.update(dislikes: @current_user.dislikes + [@params[:id].to_i])
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

end