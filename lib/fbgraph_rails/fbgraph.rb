module FBGraphRails
  def self.config
    @config ||= config_without_caching
  end
  
  def self.config_without_caching
    File.open(Rails.root.join('config', 'fbgraph.yml')) { |f| YAML.load f }
  end

  def self.global_fbclient
    @client ||= new_global_fbclient
  end
  
  def self.new_global_fbclient
    FBGraph::Client :client_id => config['id'], :secret_id => config['secret']
  end  
end
