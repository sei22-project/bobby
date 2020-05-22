class Request < ApplicationRecord
  belongs_to :user
  belongs_to :game

  after_commit :create_join_request_notifications, on: :create

  private

  def create_join_request_notifications
    Notification.create do |notification|
      notification.notify_type = 'join_request'
      notification.actor = self.user
      notification.user = User.find(self.game.host_id)
      notification.target = self
      notification.second_target = self.game
    end
  end
end