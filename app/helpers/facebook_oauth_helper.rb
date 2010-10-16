module FacebookOauthHelper
  attr_reader :facebook_client
  attr_reader :current_facebook_access_token
  
  def facebook_login_form
    form_tag new_facebook_oauth_path, :method => 'get' do
      image_submit_tag 'facebook_connect.gif', :alt => 'Connect with Facebook'
    end
  end
end
