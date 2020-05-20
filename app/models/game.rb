class Game < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category
  has_one :room

  validates :title, presence: true
  validates :venue, presence: true
  validates :start, presence: true
  validates :end, presence: true

  has_many :requests
end