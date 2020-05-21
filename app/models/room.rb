class Room < ApplicationRecord
  belongs_to :game
  has_many :messages, dependent: :destroy
end