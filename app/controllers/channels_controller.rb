class ChannelsController < ApplicationController

  before_action :set_channel, only: [:show, :edit, :update, :destroy, :join]

  def index
    @channels = Channel.all
    @channelusers = Channeluser.all
    if params[:search]
      @channels = Channel.search(params[:search]).order("created_at DESC")
    else
      @channels = Channel.all.order('created_at DESC')
    end
  end

  def show
    @message = Message.new
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    @channel.user_id = current_user.id
    if @channel.save
      redirect_to channel_path(@channel)
    else
      render json: @channel.errors.full_messages, status: 422
    end
  end

  def edit
  end

  def update
    @channel.update(channel_params)
  end

  def destroy
    @channel.destroy
    redirect_to channels_path
  end

  def join
    @channeluser = Channeluser.new({ user_id: current_user.id, channel_id: @channel.id })
    if @channeluser.save
      redirect_to channel_path(@channel)
    else
      render json: @channeluser.errors.full_messages, status: 400
    end
  end

  private

  def channel_params
    params.require(:channel).permit(:name)
  end

  def set_channel
    @channel = Channel.find(params[:id])
  end
end
