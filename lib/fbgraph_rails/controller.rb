require 'action_controller'

# :nodoc: namespace
module FBGraphRails

# Mixed into ActiveController::Base
module ControllerMixin
  def self.included(base)
    base.send :extend, ControllerClassMethods
  end
end

# Methods here become ActiveController::Base class methods.
module ControllerClassMethods  
  def probes_facebook_access_token(options = {})
    send :include, ControllerInstanceMethods    
    before_filter :probe_facebook_access_token, options
  end
    
  def requires_facebook_access_token
    send :include, ControllerInstanceMethods    
    before_filter :enforce_facebook_access_token, options    
  end
end

# Included in controllers that call the ActiveController::Base class methods.
module ControllerInstanceMethods
  attr_reader :facebook_client
  attr_reader :current_facebook_access_token
  
  def current_facebook_access_token=(new_token)
    @current_facebook_access_token = new_token
    session[:current_facebook_token] = new_token
  end

  def probe_facebook_access_token
    @current_facebook_access_token = session[:current_facebook_token]
    @facebook_client = if @current_facebook_access_token
      FBGraphRails.global_fbclient
    else
      FBGraphRails.fbclient @current_facebook_access_token
    end
  end
  private :probe_facebook_access_token
  
  def enforce_facebook_access_token(redirect_url = request.url)
    probe_facebook_access_token
    unless current_facebook_access_token
      flash[:facebook_redirect_url] = redirect_url
      redirect_to FBGraphRails.authorization_url(facebook_oauth_url)
      return false
    end
  end
  private :enforce_facebook_access_token
end

ActionController::Base.send :include, ControllerMixin

end  # namespace FBGraphRails
