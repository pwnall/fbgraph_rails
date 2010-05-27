require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "fbgraph_rails"
    gem.summary = %Q{Rails plug-in for integrating the fbgraph gem}
    gem.description = %Q{Support for sessions tied to Facebook users.}
    gem.email = "victor@costan.us"
    gem.homepage = "http://github.com/costan/fbgraph_rails"
    gem.authors = ["costan"]
    gem.add_dependency "fbgraph", ">= 0.0.5"
    gem.add_dependency "json", ">= 1.4.2"
    gem.add_dependency "oauth2", ">= 0.0.8"
    gem.add_development_dependency "jeweler", ">=1.4.0"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "fbgraph_rails #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
