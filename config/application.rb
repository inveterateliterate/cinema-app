require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ClearviewCinemas
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Central Time (US & Canada)'
    config.active_record.default_timezone = :local

    config.action_mailer.delivery_method = :smtp
	  config.action_mailer.smtp_settings = {
	    address: "smtp.gmail.com",
	    port: "587",
	    domain: "gmail.com",
	    authentication: "plain",
	    enable_starttls_auto: true,
	    user_name: ENV['GMAIL_USERNAME'],
	    password: ENV['GMAIL_PASSWORD'],
	    openssl_verify_mode: "none"
	  }
  end
end
