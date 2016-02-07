class TokensController < ApplicationController

  def get_token
    if current_user
      Twilio::Util::AccessToken.new(
        ENV['ACCOUNT_SID'],
        ENV['API_KEY_SID'],
        ENV['API_KEY_SECRET'],
        3600, 
        current_user.name
      )
    else
      redirect_to root_path
    end
  end

  def get_grant 
    grant = Twilio::Util::AccessToken::IpMessagingGrant.new 
    grant.endpoint_id = "Chatty:#{current_user.name.gsub(" ", "_")}:browser"
    grant.service_sid = ENV['IPM_SERVICE_SID']
    grant
  end

  def create
    token = get_token
    grant = get_grant
    token.add_grant(grant)
    render json: {username: current_user.name, token: token.to_jwt}
  end

end