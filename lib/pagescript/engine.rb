module Pagescript
  class Engine < ::Rails::Engine
    require 'jquery-rails'
    isolate_namespace Pagescript
    ActionView::Base.send :include, Pagescript::TagsHelper
  end
end
