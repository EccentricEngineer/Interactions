class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  after_create :default_picture

  has_many :channelusers, dependent: :delete_all
  has_many :channels, through: :channelusers
  # to be verified
  has_one :channel
  has_many :messages, dependent: :delete_all

  has_one_attached :profile_picture

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def default_picture
    default_pic = File.open('app/assets/images/default_picture.jpeg')
    profile_picture.attach(io: default_pic, filename: 'default_picture.jpeg', content_type: 'image/jpeg') unless profile_picture.attached?
  end
end
