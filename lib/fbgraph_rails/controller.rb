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
    session[:facebook_token] = new_token
  end

  def probe_facebook_access_token
    @current_facebook_access_token = session[:facebook_token]
    @facebook_client = if @current_facebook_access_token
      FBGraphRails.global_fbclient
    else
      FBGraphRails.fbclient_with_token @current_facebook_access_token
    end
  end
  
  def enforce_facebook_access_token
    facebook_access_token_probe
    unless current_facebook_access_token
      flash[:facebook_redirect_url] = request.url
      redirect_to @facebook_client.authorize_url :redirect_uri => sessions_path
      return false
    end
  end
end

ActionController::Base.send :include, ControllerMixin

end  # namespace FBGraphRails
