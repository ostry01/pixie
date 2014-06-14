# Konfiguracja AWS dla serwera z Irlandi.
require 'aws/s3'
AWS::S3::DEFAULT_HOST = "s3-eu-west-1.amazonaws.com"
Pixie::Application.configure do
  # Konfiguracja łączności paperclip'a z S3
  config.paperclip_defaults = {
    :storage => :s3,
    # Nazwa wiaderka.
    :bucket => ENV['FOG_DIRECTORY'],
    :s3_credentials => {
      # Identyfikator klucza dostępu.
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      # Tajny klucz dostępowy.
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
    },
    :s3_permissions => :public_read,
    :s3_host_name => 's3-eu-west-1.amazonaws.com',
    :url => ":s3_domain_url",  
    :path => ":class/:id/:style/:basename.:extension" 
  }
  # Początkowa konfiguracja.
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.assets.version = '1.0'
  config.log_level = :info
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
end
