# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fbgraph_rails}
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Victor Costan"]
  s.date = %q{2010-10-15}
  s.description = %q{Support for sessions tied to Facebook users.}
  s.email = %q{victor@costan.us}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".project",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "app/controllers/facebook_oauth_controller.rb",
    "app/helpers/facebook_oauth_helper.rb",
    "config/routes.rb",
    "fbgraph_rails.gemspec",
    "lib/fbgraph_rails.rb",
    "lib/fbgraph_rails/controller.rb",
    "lib/fbgraph_rails/engine.rb",
    "lib/fbgraph_rails/fbgraph_client.rb",
    "test/fbgraph_rails_test.rb",
    "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/costan/fbgraph_rails}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Rails plug-in integrating the fbgraph gem}
  s.test_files = [
    "test/fbgraph_rails_test.rb",
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<erubis>, [">= 2.3.5"])
      s.add_runtime_dependency(%q<fbgraph>, [">= 0.0.5"])
      s.add_runtime_dependency(%q<json>, [">= 1.4.2"])
      s.add_runtime_dependency(%q<oauth2>, [">= 0.0.8"])
      s.add_development_dependency(%q<jeweler>, [">= 1.4.0"])
    else
      s.add_dependency(%q<erubis>, [">= 2.3.5"])
      s.add_dependency(%q<fbgraph>, [">= 0.0.5"])
      s.add_dependency(%q<json>, [">= 1.4.2"])
      s.add_dependency(%q<oauth2>, [">= 0.0.8"])
      s.add_dependency(%q<jeweler>, [">= 1.4.0"])
    end
  else
    s.add_dependency(%q<erubis>, [">= 2.3.5"])
    s.add_dependency(%q<fbgraph>, [">= 0.0.5"])
    s.add_dependency(%q<json>, [">= 1.4.2"])
    s.add_dependency(%q<oauth2>, [">= 0.0.8"])
    s.add_dependency(%q<jeweler>, [">= 1.4.0"])
  end
end

