# frozen_string_literal: true

module HotwiredComponent
  module Forms
    class SubmitButtonComponent < BaseComponent
      def initialize(value:, options:)
        super
        @value   = value
        @options = options.merge(
          class: css_classes(options.delete(:class)),
          data:  options.delete(:data).merge({
            controller: "hotwired-component-forms--input--component"
          })
        )
      end

      private

      attr_reader :value, :options

      def css_classes(additional)
        "hotwired-component-submit-button #{additional}"
      end
    end
  end
end
