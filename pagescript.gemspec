$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pagescript/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "Pagescript"
  s.version     = Pagescript::VERSION
  s.authors     = ["Max Calabrese"]
  s.email       = ["max.calabrese@ymail.com"]
  s.homepage    = "https://github.com/maxcal/pagescript"
  s.summary     = "Page specific javascript in Rails made easy."
  s.description = "Pagescript emits custom events based on what controller and
  action was requested."
  s.license     = "MIT"

  s.files = Dir["{app,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_development_dependency "yard"
  s.add_development_dependency "kramdown"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "spring"
  s.add_development_dependency 'spring-commands-rspec'
end
