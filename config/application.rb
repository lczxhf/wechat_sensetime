require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WechatSensetime
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %W(#{config.root}/lib)
    
    config.cache_store = :redis_store, "redis://localhost:6379/2/cache", { expires_in: 90.minutes }
    config.action_dispatch.rack_cache = {
        metastore: "redis://localhost:6379/1/metastore",
        entitystore: "redis://localhost:6379/1/entitystore",
        verbose: true
    }
    config.time_zone = 'Beijing'
    config.active_record.default_timezone= :local
    config.i18n.default_locale = :"zh-CN"
    config.i18n.locale = :"zh-CN"

    config.active_job.queue_adapter = :sidekiq

    config.generators do |g|
      # g.test_framework  nil #to skip test framework
      g.assets  false
      g.helper false
      g.stylesheets false

      g.test_framework :rspec,
        :fixtures => true,
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => true,
        :request_specs => true
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end
  end
end
