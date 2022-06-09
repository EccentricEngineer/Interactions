class Channeluser < ApplicationRecord
  belongs_to :user
  belongs_to :channel
end


# validates :user_id, uniqueness: { scope: :channel_id }
# end
