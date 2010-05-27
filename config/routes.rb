Rails::Application.routes.draw do |map|
  resource :facebook_oauth, :controller => 'FacebookOauth'
end
