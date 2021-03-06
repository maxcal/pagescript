$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'pagescript/version'



# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'pagescript'
  s.version     = Pagescript::VERSION
  s.authors     = ['Max Calabrese']
  s.email       = ['max.calabrese@ymail.com']
  s.homepage    = 'https://github.com/maxcal/pagescript'
  s.summary     = 'Page specific javascript in Rails made easy.'
  s.description = 'Pagescript emits custom JS events based on what controller and
  action was requested.'
  s.license     = 'MIT'

  s.files = Dir['{app,lib, config}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  # This lets us test on different Rails versions
  rails_version = ENV["RAILS_VERSION"] || "default"
  rails = case rails_version
  when "master"
    {github: "rails/rails"}
  when "default"
    ">= 5.0"
  else
    "~> #{rails_version}"
  end

  s.required_ruby_version = '>= 2.2.2'

  s.add_dependency 'rails', rails
  s.add_dependency 'jquery-rails', '~> 4.2', '>= 4.2.1'
  s.add_development_dependency 'yard', '~> 0.9.5'
  s.add_development_dependency 'rspec-rails','~> 3.5', '>= 3.5.2'
  s.add_development_dependency 'guard-rspec', '~> 4.7', '>= 4.7.3'
  s.add_development_dependency 'spring', '~> 2.0'
  s.add_development_dependency 'spring-commands-rspec', '~> 1.0', '>= 1.0.4'
  s.add_development_dependency 'poltergeist', '~> 1.11'
  s.add_development_dependency 'rubocop', '~> 0.44.1'
  s.add_development_dependency 'puma'
end
