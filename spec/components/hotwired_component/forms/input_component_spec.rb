# frozen_string_literal: true

require "rails_helper"

RSpec.describe HotwiredComponent::Forms::InputComponent, type: :component do
  subject do
    described_class.new(
      method:      :field,
      object:      MockModel.new,
      object_name: :mock_model,
      options:     {
        class: "a-class"
      }
    )
  end

  let(:css_classes) do
    "input#mock_model_field.hotwired-component-forms-text.a-class[type='text']" \
      "[data-controller='hotwired-component--forms--text']" \
      "[name='mock_model[field]']"
  end

  it "renders the component" do
    render_inline(subject)

    expect(rendered_component).to have_css(css_classes)
  end

  describe "with value" do
    subject do
      described_class.new(
        method:      :field,
        object:      MockModel.new,
        object_name: :mock_model,
        options:     {
          class: "a-class",
          value: "test value"
        }
      )
    end

    it "renders the component with the value set" do
      render_inline(subject)

      expect(rendered_component).to have_css("input[value='test value']")
    end
  end
end
