#https://www.twilio.com/blog/2016/02/add-chat-to-a-rails-app-with-twilio-ip-messaging.html?utm_source=rubyweekly&utm_medium=email

class TokensController < ApplicationController

#if a current_user is signed in, prep an access token with these 
#credientials. Set username to current_user.name. Otherwise redirect 
#to the signin/signup page
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

#gets endpoints from Twilio api.
  def get_grant 
    grant = Twilio::Util::AccessToken::IpMessagingGrant.new 
    grant.endpoint_id = "Chatty:#{current_user.name.gsub(" ", "_")}:browser"
    grant.service_sid = ENV['IPM_SERVICE_SID']
    grant
  end

#creates a token from the twilio api
#creates a grant from the twilio api
#appends that grant to the token, then sends json
#{username: current_user.name, token: token(as a json web token)}

  def create
    token = get_token
    grant = get_grant
    token.add_grant(grant)
    render json: {username: current_user.name, token: token.to_jwt}
  end

end