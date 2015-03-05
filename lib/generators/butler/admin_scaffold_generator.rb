require 'rails/generators/resource_helpers'

module Butler
  class AdminScaffoldGenerator < Rails::Generators::NamedBase
    include Rails::Generators::ResourceHelpers

    source_root File.expand_path('../templates', __FILE__)

    class_option :orm, banner: 'NAME', type: :string, required: true
    class_option :prefix_name, banner: 'admin', type: :string, default: 'admin'
    class_option :parent_controller, banner: 'admin', type: :string, default: 'admin'

    argument :attributes, type: :array, default: [], banner: 'field:type field:type'

    def create_ressource_model
      invoke 'active_record:model' unless model_exists? && behavior == :invoke
    end

    def create_admin_controller
      template 'admin_controller_generator.rb', File.join('app', 'controllers', 'admin_controller.rb') unless file_exists?('app/controllers/admin_controller.rb')
    end

    def create_admin_ressource_controller
      template 'controller_generator.rb', File.join('app', 'controllers', prefix, class_path, "#{controller_file_name}_controller.rb")
    end

    def create_admin_helper
      template 'helpers/admin_helper.rb', File.join('app', 'helpers', 'admin_helper.rb') unless file_exists?('app/helpers/admin_helper.rb')
    end

    def create_admin_layout_views
      unless file_exists?('app/views/layouts/admin.html.haml')
        template 'layouts/admin.html.haml', File.join('app', 'views', 'layouts', 'admin.html.haml')
      end

      unless file_exists?('app/views/admin/partials/_menu.html.haml')
        template 'admin/partials/_menu.html.haml', File.join('app', 'views', prefix, 'partials', '_menu.html.haml')
      end

      unless file_exists?('app/views/admin/partials/_user_profile.html.haml')
        template 'admin/partials/_user_profile.html.haml', File.join('app', 'views', prefix, 'partials', '_user_profile.html.haml')
      end
    end

    def copy_main_assets
      unless file_exists?('app/assets/javascripts/admin.js.coffee')
        template 'assets/admin.js.coffee', File.join('app', 'assets', 'javascripts', 'admin.js.coffee')
      end

      unless file_exists?('app/assets/stylesheets/admin.scss')
        template 'assets/admin.scss', File.join('app', 'assets', 'stylesheets', 'admin.scss')
      end
    end

    def create_admin_ressource_views
      available_views.each do |view|
        filename = filename_with_extensions(view)
        template "admin/views/#{filename}", File.join('app/views', prefix, controller_file_path, filename)
      end

      template 'admin/views/_form.html.haml', File.join('app/views', prefix, controller_file_path, '_form.html.haml')
    end

    hook_for :resource_route, in: :rails do |resource_route|
      invoke resource_route, [prefixed_class_name]
    end

    def create_simple_form_config
      unless file_exists?('config/initializers/simple_form.rb')
        invoke 'simple_form:install', nil, ['--bootstrap']
      end
    end

    def copy_simple_form_custom_config
      unless file_exists?('config/initializers/simple_form_inline_label_fix.rb')
        template 'config/initializers/simple_form_inline_label_fix.rb', File.join('config', 'initializers', 'simple_form_inline_label_fix.rb')
      end

      unless file_exists?('config/initializers/simple_form_wrappers.rb')
        template 'config/initializers/simple_form_wrappers.rb', File.join('config', 'initializers', 'simple_form_wrappers.rb')
      end
    end

    def setup_kaminari
      unless file_exists?('config/initializers/kaminari_config.rb')
        invoke 'kaminari:config'
      end
    end


    protected
      def available_views
        %w(index show edit new)
      end

      def prefix
        options[:prefix_name]
      end

      def prefixed_class_name
        "#{prefix.capitalize}::#{class_name}"
      end

      def prefixed_controller_class_name
        "#{prefix.capitalize}::#{controller_class_name}"
      end

      def parent_controller_class_name
        options[:parent_controller].capitalize
      end

      def prefixed_route_url
        "/#{prefix}#{route_url}"
      end

      def prefixed_plain_model_url
        "#{prefix}_#{singular_table_name}"
      end

      def prefixed_index_helper
        "#{prefix}_#{index_helper}"
      end

      def format
        :html
      end

      def handler
        :haml
      end

      def filename_with_extensions(name)
        [name, format, handler].compact.join('.')
      end

      def model_exists?
        file_exists?("app/models/#{file_path}.rb")
      end

      def file_exists?(file_path)
        File.exists?(File.join(destination_root, file_path))
      end
  end
end
