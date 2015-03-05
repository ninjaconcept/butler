require "butler/version"
require "sass"
require "bootstrap-sass"
require "haml-rails"
require "jquery-rails"
require "jquery-ui-rails"
require 'jquery-fileupload-rails'
require 'momentjs-rails'
require 'bootstrap3-datetimepicker-rails'
require 'font-awesome-rails'
require 'bourbon'
require 'cocoon'
require 'simple_form'
require 'kaminari'
require 'rails-i18n'
# require 'x-editable-rails'

module Butler
  class Engine < ::Rails::Engine
    # Load all folders and files in locales.
    config.i18n.load_path += Dir[Butler::Engine.root.join('config', 'locales', '**', '*.{rb,yml}')]
  end
end
