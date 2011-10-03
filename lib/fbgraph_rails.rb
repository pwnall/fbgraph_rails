# FbgraphRails
module FBGraphRails
end

require 'fbgraph_rails/fbgraph_client.rb'

if defined?(Rails)
  require 'fbgraph_rails/controller.rb'
  require 'fbgraph_rails/engine.rb'
end
