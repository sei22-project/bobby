class Request < ApplicationRecord
  belongs_to :user
  belongs_to :game

  after_commit :create_join_request_notifications, on: :create
  after_commit :withdraw_join_request_notifications, on: :destroy
  after_commit :update_join_request_notifications, on: :update

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

  def withdraw_join_request_notifications
    Notification.create do |notification|
      notification.notify_type = 'withdraw_request'
      notification.actor = self.user
      notification.user = User.find(self.game.host_id)
      notification.target = self
      notification.second_target = self.game
    end
  end

  def update_join_request_notifications
    if self.status == 0
      Notification.create do |notification|
        notification.notify_type = 'left_game'
        notification.actor = self.user
        notification.user = User.find(self.game.host_id)
        notification.target = self
        notification.second_target = self.game
      end
    else
      Notification.create do |notification|
        notification.notify_type = 'update_request'
        notification.actor = User.find(self.game.host_id)
        notification.user = self.user
        notification.target = self
        notification.second_target = self.game
      end
    end
  end
end