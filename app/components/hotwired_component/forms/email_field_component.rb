# frozen_string_literal: true

module HotwiredComponent
  module Forms
    class EmailFieldComponent < InputComponent
      INPUT_TYPE = "email"

      private

      def field_tag(*args)
        email_field_tag(*args)
      end
    end
  end
end
