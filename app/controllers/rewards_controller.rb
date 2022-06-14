class RewardsController < ApplicationController

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      redirect_to reward_path(@reward)
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
    params.require(:reward).permit(:name, :price)
  end
end
