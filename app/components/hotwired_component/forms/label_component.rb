# frozen_string_literal: true

module HotwiredComponent
  module Forms
    class LabelComponent < BaseComponent
      def initialize(
        method:,
        object_name:,
        value: nil,
        options: {}
      )
        super
        @method      = method
        @object_name = object_name
        @value       = value
        @options     = options.merge(
          class: css_classes(options.delete(:class)),
          data:  {
            controller: "hotwired-component--forms--label-component"
          }
        )
      end

      def css_classes(additional)
        "hotwired-component-forms-label #{additional}"
      end

      private

      attr_reader :method, :object_name, :options, :value

      def content
        super || value || method.to_s.titleize
      end

      def render?
        !content.blank?
      end
    end
  end
end
