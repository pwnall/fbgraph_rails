# FbgraphRails
module FBGraphRails
end

require 'fbgraph_rails/fbgraph.rb'

if defined?(Rails)
  require 'fbgraph_rails/controller.rb'
  require 'fbgraph_rails/railtie.rb'
end
