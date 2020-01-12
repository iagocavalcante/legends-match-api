class MatchChannel < ApplicationCable::Channel
  def subscribed
    "match_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
