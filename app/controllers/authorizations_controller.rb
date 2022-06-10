class AuthorizationsController < ApplicationController
  skip_before_action :authenticate_user!

  def code
    response = HTTParty.post("https://api.instagram.com/oauth/access_token", {
      body: {
        client_id: '425954065799626',
        client_secret: '97073432d582ad729d44ad784a9d79b6',
        grant_type: 'authorization_code',
        redirect_uri: "#{ENV['INSTAGRAM_REDIRECT_URI']}/code" ,
        code: params[:code]
      }
    })

    session[:access_token] = response.parsed_response['access_token']
    session[:instagram_user_id] = response.parsed_response['user_id']

    redirect_to root_path

  end
end
