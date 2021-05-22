# frozen_string_literal: true

module HotwiredComponent
  module Tw
    module Forms
      class PasswordFieldComponent < InputComponent
        private

        def text_field_tag(*args)
          password_field_tag(*args)
        end
      end
    end
  end
end
