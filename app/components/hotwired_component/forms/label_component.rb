# frozen_string_literal: true

module HotwiredComponent
  module Forms
    class LabelComponent < InputComponent
      def initialize(value:, **args)
        super(**args)
        @value = value
      end

      private

      attr_reader :value

      def field_type
        "label"
      end

      def content
        super || value || method.to_s.titleize
      end

      def render?
        !content.blank?
      end
    end
  end
end
