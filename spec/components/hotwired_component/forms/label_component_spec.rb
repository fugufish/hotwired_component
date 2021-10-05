# frozen_string_literal: true

require "rails_helper"

RSpec.describe HotwiredComponent::Forms::LabelComponent, type: :component do
  subject do
    described_class.new(
      method:      :field,
      object:      MockModel.new,
      object_name: :mock_model,
      value:       "Field",
      options:     {
        class: "label"
      }
    )
  end

  let(:css_classes) do
    "label.hotwired-component-forms-label.label" \
    "[for='mock_model_field']" \
    "[data-controller='hotwired-component--forms--label-component']"
  end

  it "should render the component" do
    render_inline(subject)

    expect(rendered_component).to have_css(css_classes)
    expect(rendered_component).to have_text("Field")
  end

  context "with block" do
    subject do
      described_class.new(
        method:      :field,
        object:      MockModel.new,
        object_name: :mock_model,
        options:     {
          class: "label"
        }
      )
    end

    it "should render the component with the correct value" do
      render_inline(subject) do
        "test"
      end

      expect(rendered_component).to have_text("test")
    end
  end

  context "with no value" do
    subject do
      described_class.new(
        method:      :field,
        object:      MockModel.new,
        object_name: :mock_model,
        options:     {
          class: "label"
        }
      )
    end

    it "should render with the method name as the label" do
      render_inline(subject)

      expect(rendered_component).to have_text("Field")
    end
  end

  context "with errors" do
    let(:css_classes) { "label.has-error" }

    subject do
      described_class.new(
        method:      :field,
        object:      MockModel.new(errors: { field: "an error" }),
        object_name: :mock_model,
        value:       "Field",
        options:     {
          class: "label"
        }
      )
    end

    it "should render with the 'has-error' class" do
      render_inline(subject)

      expect(rendered_component).to have_css(css_classes)
    end
  end
end
