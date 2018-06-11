require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SugarTictactoe
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.i18n.default_locale = :en
    config.i18n.fallbacks =[:en]
  end
end
