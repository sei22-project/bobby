class Request < ApplicationRecord
  belongs_to :user
  belongs_to :game

  after_commit :create_notifications, on: :create

  private

  def create_notifications
    Notification.create do |notification|
      notification.notify_type = 'post'
      notification.actor = self.user
      notification.user = User.find(self.game.host_id)
      notification.target = self
      notification.second_target = self.game
    end
  end
end