require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module SolidoWeb
  class Application < Rails::Application
    config.load_defaults 7.0
    config.generators.template_engine = :haml
    config.base_api = 'http://127.0.0.1:3000'
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.autoloader = :zeitwerk

  end
end
