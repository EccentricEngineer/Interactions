class Channel < ApplicationRecord
  belongs_to :user
  has_many :channelusers, dependent: :delete_all
  has_many :users, through: :channelusers

  has_one_attached :photo

  has_many :messages, dependent: :delete_all
  has_many :feeds, dependent: :delete_all
  has_many :posts, dependent: :delete_all
  has_many :rewards, dependent: :delete_all
  has_many :coins, dependent: :delete_all

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
