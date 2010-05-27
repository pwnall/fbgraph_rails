class FacebookOauthController < ApplicationController
  probes_facebook_access_token
  
  # GET /facebook_oauth/new
  def new
    self.current_facebook_access_token = nil
    enforce_facebook_access_token root_path
  end
  
  # Redirect from Facebook: GET /facebook_oauth
  def show
    self.current_facebook_access_token =
        facebook_client.authorization.process_callback params[:code],
            :redirect_uri => facebook_oauth_url
    redirect_to flash[:facebook_redirect_url]
  end
  
  # DELETE /facebook_oauth
  def destroy
    self.current_facebook_access_token = nil
  end
end
