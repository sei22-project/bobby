class User < ApplicationRecord
  # Include default devise modules. Others available are:
  include Gravtastic
  gravtastic :default => 'https://www.xeus.com/wp-content/uploads/2014/09/One_User_Orange.png'
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_and_belongs_to_many :games
  has_many :requests

  #Active Storage
  has_one_attached :avatar

  after_commit :update_user_name, on: :create

  def update_user_name
    user = User.last
    user.update(name: user.email.to_s.split('@')[0])
  end

end