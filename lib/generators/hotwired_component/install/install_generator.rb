module HotwiredComponent
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    # def install_hotwired_rails
    #   rake "hotwire:install"
    # end

    def add_application_component
      template "application_component.rb.erb", 
        "app/components/application_component.rb"
    end

    def add_component_controllers
      append_to_file "app/javascript/controllers/index.js" do
        <<~JAVASCRIPT
          context = require.context("../../components", true, /_controller\.js$/)
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