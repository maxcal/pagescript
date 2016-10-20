module Pagescript
  # Main Rails integration.
  # Used primarily to add the gem assets to the Sprockets pipeline.
  class Engine < ::Rails::Engine
    require 'jquery-rails'
    isolate_namespace Pagescript
    ActionView::Base.send :include, Pagescript::TagsHelper
  end
end
