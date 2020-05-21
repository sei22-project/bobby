class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    html_user = ApplicationController.render(
      partial: 'messages/message',
      locals: {message: message}
    )

    html_other = ApplicationController.render(
      partial: 'messages/other-message',
      locals: {message: message }
    )

    ActionCable.server.broadcast "room_channel_#{message.room_id}", html_user: html_user, html_other: html_other, message: message
  end
end