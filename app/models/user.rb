class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :channelusers
  has_many :channels, through: :channelusers
  # to be verified
  has_one :channel
  has_many :messages

  has_one_attached :profile_picture

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
