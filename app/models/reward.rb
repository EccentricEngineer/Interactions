class Reward < ApplicationRecord
  belongs_to :channel
  has_one_attached :photo
end
