# frozen_string_literal: true

module HotwiredComponent
  module Forms
    class SubmitButtonComponent < BaseComponent
      def initialize(value:, **args)
        super(**args)
        @value   = value
        @options = options.merge(
          class: css_classes(options.delete(:class)),
          data:  options.delete(:data).merge({
            controller: "hotwired-component-forms--submit--component"
          })
        )
      end

      private

      attr_reader :value

      def css_base_class
        "hotwired-component-submit-button"
      end
    end
  end
end
