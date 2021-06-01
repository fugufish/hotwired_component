# frozen_string_literal: true

module HotwiredComponent
  module Forms
    class InputComponent < BaseComponent
      def initialize(builder:, method:, object_name:, **args)
        @method      = method
        super(**args)
        @builder     = builder
        @object_name = object_name
        @options     = options.merge(
          id:   "#{object_name}_#{method}",
          name: "#{object_name}[#{method}]",
          data: {
            controller: "hotwired-component--forms--#{field_type}-component"
          }
        )
      end

      private

      attr_reader :method, :object_name, :builder

      def name
        "#{object_name}[#{method}]"
      end

      def css_base_class
        classes = "hotwired-component-forms-#{field_type}"
        classes = "#{classes} has-error" unless object.errors[method].empty?
        classes
      end

      def field_tag(*args)
        public_send("#{field_type}_field_tag", *args)
      end

      def field_type
        raise NotImplementedError
      end
    end
  end
end
