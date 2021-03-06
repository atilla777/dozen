require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dozen
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # ++
    # Russian local by default
    config.i18n.default_locale = :ru

    #++
    #Delayued Job for email send
    config.active_job.queue_adapter = :delayed_job
  end
end
