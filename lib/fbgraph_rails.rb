# FbgraphRails
module FBGraphRails
end

require 'fbgraph_rails/fbgraph_client.rb'

if defined?(Rails)
  require 'fbgraph_rails/controller.rb'
  require 'fbgraph_rails/engine.rb'

  # HACK(costan): this works around a known Rails bug
  #     https://rails.lighthouseapp.com/projects/8994/tickets/1905-apphelpers-within-plugin-not-being-mixed-in
  require File.expand_path('../../app/helpers/facebook_oauth_helper.rb', __FILE__)
  ActionController::Base.helper FacebookOauthHelper
end
