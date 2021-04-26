module HotwiredComponent
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def install_hotwired_rails
      run "rails hotwire:install"
    end
    
    def add_component_controllers
      append_to_file "app/javascript/packs/application.js" do
        <<~JAVASCRIPT
          const component_stylesheets = require.context(
              "../../components/",
              true,
              /\.scss$/
          );

          component_stylesheets.keys().map(component_stylesheets);
        JAVASCRIPT

      end
      append_to_file "app/javascript/controllers/index.js" do
        <<~JAVASCRIPT
          context = require.context("components", true, /_controller\.js$/)
          application.load(definitionsFromContext(context))    
        JAVASCRIPT
      end
    end

    def update_webpacker_config
      gsub_file "config/webpacker.yml", "additional_paths: [", 
        "additional_paths: [\"app/components\""
    end
  end
end