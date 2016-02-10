#https://www.twilio.com/blog/2016/02/add-chat-to-a-rails-app-with-twilio-ip-messaging.html?utm_source=rubyweekly&utm_medium=email

class TokensController < ApplicationController

#function for create action
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

#function for create action
#gets a new twilio grant, sets the endpoint and service SID for the grant, returns the grant
  def get_grant 
    grant = Twilio::Util::AccessToken::IpMessagingGrant.new 
    grant.endpoint_id = "Chatty:#{current_user.name.gsub(" ", "_")}:browser"
    grant.service_sid = ENV['IPM_SERVICE_SID']
    grant
  end

#when ajax post to this controller gets made, a token is made
#a grant gets made. The grant is added to the token
#then JSON gets rendered, with username set to current_user.name and the token 
#as a json web token.
  def create
    token = get_token
    grant = get_grant
    token.add_grant(grant)
    render json: {username: current_user.name, token: token.to_jwt}
  end

end