# frozen_string_literal: true

require_relative 'boot'

require 'fog/aws'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Routine
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
    config.action_view.field_error_proc = proc do |html_tag, _instance|
      html_tag
    end

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
