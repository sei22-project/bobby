class ActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_channel"

    if current_user

      current_user.update(online: true)

    end

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    ActionCable.server.broadcast "activity_channel", user_email: current_user.email, user_id: current_user.id, status: 'offline'

    if current_user

      current_user.update(online: false)

    end

  end

  def appear
    ActionCable.server.broadcast "activity_channel", user_email: current_user.email, user_id: current_user.id, status: 'online'
  end

end