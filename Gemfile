source 'https://rubygems.org'

# Declare your gem's dependencies in pagescript.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

# This is used to load the file 'Gemfile.local.rb' if present
# this can be used to require additional OS dependent gems or that just should
# not be checked in.
user_gemfile = File.expand_path('Gemfile.local.rb', __dir__)
if File.exists?( user_gemfile )
  proc = Proc.new {}
  eval(File.read(user_gemfile), proc.binding, user_gemfile)
end
