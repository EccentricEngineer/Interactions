class ChannelusersController < ApplicationController
  def destroy
    @channeluser = Channeluser.find(params[:id])
    @coin = Coin.find_by(user:current_user, channel: @channeluser.channel)
    @channeluser.destroy
    @coin.destroy
    redirect_to channels_path
  end
end
