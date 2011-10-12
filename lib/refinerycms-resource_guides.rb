require 'refinerycms-base'

module Refinery
  module ResourceGuides
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "resource_guides"
          plugin.activity = {
            :class => ResourceGuide
          }
        end
      end
    end
  end
end
require File.expand_path('../refinerycms-guide_authors', __FILE__)