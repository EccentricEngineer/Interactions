class Post < ApplicationRecord
  # validates :url #, uniqueness: true
  belongs_to :channel
end
