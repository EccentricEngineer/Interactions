class Channel < ApplicationRecord
  belongs_to :user
  has_many :channelusers
  has_many :users, through: :channelusers

  has_one_attached :photo
end
