# frozen_string_literal: true

module HotwiredComponent
  module Tw
    module Forms
      class SubmitButtonComponent < TwComponent
        def initialize(value:, options:)
          super
          @value   = value
          @options = options.merge(
            class: css_classes(options.delete(:class)),
            data:  {
              controller: "hotwired-component-tw--forms--input--component"
            }
          )
        end

        private

        attr_reader :value, :options

        def css_classes(additional)
          (
            ["hotwired-component-tw-submit-button"] +
            Tw.submit_button_classes +
            [additional]
          ).compact
            .join(" ")
        end
      end
    end
  end
end
