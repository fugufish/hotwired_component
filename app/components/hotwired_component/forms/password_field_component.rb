# frozen_string_literal: true

module HotwiredComponent
  module Forms
    class PasswordFieldComponent < InputComponent
      INPUT_TYPE = "password"

      private

      def field_tag(*args)
        password_field_tag(*args)
      end
    end
  end
end
