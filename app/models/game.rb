class Game < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category
  has_one :room
end