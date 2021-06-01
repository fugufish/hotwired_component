# frozen_string_literal: true

module HotwiredComponent
  module Forms
    class TemplateGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      def check_for_named_view
        unless File.exist?(template_file)
          error("A form component with the name '#{class_name}' does not exist")
        end
      end

      def copy_view
        copy_file(template_file, destination)
      end

      private

      def template_file
        Engine.root.join(
          "app",
          "components",
          file_name,
          "#{base_name}.html.erb"
        )
      end

      def base_name
        File.basename(file_name)
      end

      def destination
        "app/components/#{file_name}/#{base_name}.html.erb"
      end

      def file_name
        "hotwired_component/forms/#{super}_component"
      end
    end
  end
end
