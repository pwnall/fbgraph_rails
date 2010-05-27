require 'fbgraph_rails'
require 'rails'

# :nodoc: namespace
module FBGraphRails

class Engine < Rails::Engine
  paths.app.controllers = 'lib/app/controllers'
end  # class FBGraphRails::Engine

end  # namespace FBGraphRails
