Rails.application.config.i18n.load_path += Dir[Butler::Engine.root.join('config', 'locales', '**', '*.{rb,yml}')]
