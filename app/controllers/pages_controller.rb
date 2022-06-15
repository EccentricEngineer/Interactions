class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # raise
    if session[:instagram_user_id]
      path = "https://graph.instagram.com/#{session[:instagram_user_id]}?fields=id,username&access_token=#{session[:access_token]}"
      results = HTTParty.get(path)
      @username = results.parsed_response['username']
    end
  end
end
