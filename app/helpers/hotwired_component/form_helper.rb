# frozen_string_literal: true

module HotwiredComponent
  module FormHelper
    class FormBuilder < ActionView::Helpers::FormBuilder
      def label(method, content_or_options = {}, options = {}, &block)
        content, options = extract_label_options(content_or_options,
          options)

        template.render(Forms::LabelComponent.new(
          method:      method,
          builder:     self,
          object_name: object_name,
          object:      object,
          options:     options,
          value:       content
        ), &block)
      end

      def text_field(method, options = {})
        template.render(Forms::TextFieldComponent.new(
          builder:     self,
          method:      method,
          object_name: object_name,
          object:      object,
          options:     options
        ))
      end

      def email_field(method, options = {})
        text_field(method, options.merge(type: "email"))
      end

      def password_field(method, options = {})
        text_field(method, options.merge(type: "password"))
      end

      def submit(value = "Submit", options = {})
        template.render(Forms::SubmitButtonComponent.new(
          object:  object,
          value:   value,
          options: options
        ))
      end

      private

      attr_reader :template

      def extract_label_options(content_or_options, options)
        if content_or_options.is_a? String
          content = content_or_options
        else
          options = content_or_options
        end

        [content, options]
      end
    end

    def hw_form_for(model, options = {}, &block)
      action = model.respond_to?(:persisted?) && model.persisted? ? :edit : :new
      form_for(
        model, options.merge(
          builder: options.delete(:builder) || FormBuilder,
          data:    {
            controller: "hotwired-component--form"
          },
          html:    {
            class: "hotwired-component-form #{dom_class(model, action)}"
          }
        ), &block
      )
    end

    alias hw_form_with hw_form_for
  end
end
