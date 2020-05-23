class Game < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category
  has_one :room, dependent: :destroy

  validates :title, :venue, :players_required, :start, :end, presence: true

  has_many :requests
end