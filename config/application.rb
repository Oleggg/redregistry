require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module Bigbrother
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.time_zone = 'Moscow'
    config.i18n.default_locale = :ru
    #config.autoload_paths += %W(#{config.root}/lib)
    #config.autoload_paths << File.join(config.root, "lib")
    #config.autoload_paths += %W(#{Rails.root}/lib) 
    config.filter_parameters << :password
  end
end

