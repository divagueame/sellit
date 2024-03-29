require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sellit
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # config.assets.paths << Rails.root.join("app", "assets", "fonts")
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    #available languages
    # config.i18n.available_locales = [:en, :es]
    #language by default
    # config.i18n.default_locale = :en

    I18n.available_locales = [:en, :es]
    I18n.default_locale = :en

    # Allow multiquery
    config.active_record.async_query_executor = :global_thread_pool

    # Sidekiq
    config.active_job.queue_adapter = :sidekiq
  end
end
