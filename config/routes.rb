FBGraphRails::Engine.routes.draw do
  resource :facebook_oauth, :controller => 'FacebookOauth'
end
