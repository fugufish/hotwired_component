# frozen_string_literal: true

module HotwiredComponent
  module Tw
    module Forms
      class EmailFieldComponent < InputComponent
        private

        def text_field_tag(*args)
          email_field_tag(*args)
        end
      end
    end
  end
end
