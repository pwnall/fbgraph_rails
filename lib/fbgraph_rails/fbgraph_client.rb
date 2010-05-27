require 'erubis'
require 'fbgraph'

module FBGraphRails
  def self.config
    @config ||= config_without_caching
  end
  
  def self.config_without_caching
    erb_file = File.read(Rails.root.join('config', 'fbgraph.yml'))
    YAML.load Erubis::Eruby.new(erb_file).result
  end

  def self.global_fbclient
    @client ||= new_global_fbclient
  end
  
  def self.fbclient(access_token)
    FBGraph::Client.new :client_id => config['id'], :token => access_token,
                        :secret_id => config['secret'] 
  end
  
  def self.new_global_fbclient
    FBGraph::Client.new :client_id => config['id'],
                        :secret_id => config['secret']
  end
    
  def self.authorization_url(redirect_url)
    global_fbclient.authorization.authorize_url :redirect_uri => redirect_url,
        :scope => config['scope'].sort.join(',')
  end
end
