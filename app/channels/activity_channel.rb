class ActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_channel"

    if current_user
      if current_user.online == false
        current_user.update(online: true)
        ActionCable.server.broadcast "activity_channel", user_email: current_user.email, user_id: current_user.id, status: 'online'
      end
    end

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed

    if current_user
      if current_user.online == true
        ActionCable.server.broadcast "activity_channel", user_email: current_user.email, user_id: current_user.id, status: 'offline'
        current_user.update(online: false)
      end
    end

  end

  def appear
  end

end