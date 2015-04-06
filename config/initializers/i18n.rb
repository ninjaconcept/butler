Rails.application.config.i18n.available_locales = [:en, :de]
Rails.application.config.i18n.default_locale = :en

Rails.application.config.i18n.load_path += Dir[Butler::Engine.root.join('config', 'locales', '**', '*.{rb,yml}')]

Rails.application.config.i18n.fallbacks = { 'en-GB' => 'en', 'de-DE' => 'de' }
