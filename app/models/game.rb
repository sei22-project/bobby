class Game < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category
  has_one :room, dependent: :destroy

  validates :title, :venue, :players_required, :start, :end, presence: true

  has_many :requests

  def pending_requests
    return requests.where(status: 3)
  end

  def participants
    return self.users.where.not(id: self.host_id)
  end
  
  def host
    return User.where(id: self.host_id)
  end

end