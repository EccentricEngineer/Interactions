class RewardsController < ApplicationController

  def new
    @channel = Channel.find(params[:channel_id])
    @reward = Reward.new
  end

  def create
    @channel = Channel.find(params[:channel_id])
    @reward = Reward.new(reward_params)
    @reward.channel = @channel
    if @reward.save
      redirect_to channel_path(@channel)
    else
      render json: @reward.errors.full_messages, status: 422
    end
  end

  def destroy
    @reward.destroy
    redirect_to rewards_path
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :price, :photo)
  end
end
