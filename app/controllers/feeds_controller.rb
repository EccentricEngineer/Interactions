class FeedsController < ApplicationController

  def index
    @channel = Channel.find(params[:channel_id])
    if session[:instagram_user_id]
      path = "https://graph.instagram.com/#{session[:instagram_user_id]}?fields=id,username,media&access_token=#{session[:access_token]}"
      results = HTTParty.get(path)
      @username = results.parsed_response['username']

      media = results.parsed_response["media"]["data"]
      # p media

      media.each do |x|
        path = "https://graph.instagram.com/#{x["id"]}?fields=media_url,username,caption&access_token=#{session[:access_token]}"
        results = HTTParty.get(path)
        parsed_results = results.parsed_response
        p parsed_results
        Post.create(channel: @channel,url:results.parsed_response["media_url"],caption:results.parsed_response["caption"])

        # Feed.new << parsed_results
      end
    end
  end
end
