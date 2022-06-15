class Post < ApplicationRecord
  validates :url, uniqueness: true
  belongs_to :channel

  has_one_attached :url2
end
