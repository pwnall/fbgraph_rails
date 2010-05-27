class SessionsController < ActionController::Base
  probes_facebook_access_token
  
  # GET /sessions/new
  def new
    if current_facebook_access_token
      
    end
  end
  
  # Redirect from Facebook: POST /sessions/new
  def create
    self.current_facebook_access_token =
        facebook_client.authorization.process_callback params[:code]
    redirect_to flash[:facebook_redirect_url]
  end
end
