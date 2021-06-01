# frozen_string_literal: true

module HotwiredComponent
  module Forms
    class BaseComponent < HotwiredComponent::BaseComponent
      def initialize(object:, options:, **args)
        super(**args)
        @object  = object
        @options = options.merge(
          class: css_classes(options.delete(:class))
        )
      end

      private

      attr_reader :object, :options

      def css_base_class
        raise NotImplementedError
      end

      def css_classes(additional = nil)
        classes = css_base_class
        classes = "#{classes} #{additional}" if additional
        classes
      end
    end
  end
end
