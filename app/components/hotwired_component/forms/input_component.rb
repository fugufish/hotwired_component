# frozen_string_literal: true

module HotwiredComponent
  module Forms
    class InputComponent < BaseComponent
      INPUT_TYPE = "text"

      def initialize(method:, object:, object_name:, options:)
        super
        @method      = method
        @content     = content
        @object      = object
        @object_name = object_name
        @options     = options.merge(
          id:    "#{object_name}_#{method}",
          name:  "#{object_name}[#{method}]",
          class: css_classes(options.delete(:class)),
          data:  {
            controller: "hotwired-component--forms--#{INPUT_TYPE}-component"
          }
        )
      end

      private

      attr_reader :method, :object, :object_name, :options

      def name
        "#{object_name}[#{method}]"
      end

      def css_classes(additional)
        "hotwired-component-forms-#{INPUT_TYPE} #{additional}"
      end
    end
  end
end
