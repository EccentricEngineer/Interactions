class CoinsController < ApplicationController

  def update
    @coin = Coin.find(params[:id])
    if params[:data][:action] == "update"
      @coin.balance += 10
      if @coin.save
        redirect_to channel_path(@coin.channel)
      end
    else
      @reward_price = Reward.find(params[:data][:id]).price
      @coin.balance -= @reward_price
      if @coin.save
        redirect_to channel_path(@coin.channel)
      end
    end
  end
end
