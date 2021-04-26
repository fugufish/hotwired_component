# frozen_string_literal: true

module HotwiredComponent
  ##
  # Generates ViewComponents with Stimulus/Hotwire
  class ComponentGenerator < Rails::Generators::NamedBase
    source_root File.expand_path("templates", __dir__)

    def create_component_file
      template(
        "component.rb.erb",
        File.join("app/components", class_path, "#{file_name}_component.rb")
      )
    end

    def create_scss_file
      template(
        "component.scss.erb",
        File.join(
          "app/components",
          class_path,
          "#{file_name}_component/#{file_name}_component.scss"
        )
      )
    end

    def create_template_file
      create_file(
        File.join(
          "app/components",
          class_path,
          "#{file_name}_component/#{file_name}_component.html.erb"
        ),
        component_div
      )
    end

    def create_javascript_file
      template(
        "component_controller.js.erb",
        File.join(
          "app/components",
          class_path,
          "#{file_name}_component/component_controller.js"
        )
      )
    end

    def create_test_file
      template(
        "component_spec.rb.erb",
        File.join("spec/components", class_path,
          "#{file_name}_component_spec.rb")
      )
    end

    private

    def css_class_name
      "#{class_path.join('-')}-#{file_name}"
    end

    def component_div
      "<div class=\"#{css_class_name}\" " \
        "data-controller=\"#{class_path.join('--')}--" \
        "#{file_name.dasherize}--component\">" \
      "</div>"
    end
  end
end
