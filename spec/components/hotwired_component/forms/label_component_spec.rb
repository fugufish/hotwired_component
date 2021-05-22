# frozen_string_literal: true

require "rails_helper"

RSpec.describe HotwiredComponent::Tw::Forms::LabelComponent, type: :view do
  let(:method)      { :email }
  let(:object_name) { "user" }
  let(:value)       { nil }
  let(:alt)         { nil }
  let(:options)     { {} }

  let(:default_options) do
    {
      method:      method,
      object_name: object_name,
      value:       value,
      options:     options
    }
  end

  subject { described_class.new(**default_options) }

  describe "render" do
    context "default label" do
      it "should render a valid label" do
        render(subject)

        expect(rendered).to have_css(
          ".hotwired-component-tw-forms-label" \
          "[data-controller='hotwired-component--tw--forms--label--component']"
        )

        expect(rendered).to have_text("Email")
      end
    end

    context "explicit label" do
      let(:value) { "Text" }
      it "should render a valid label" do
        render(subject)
        expect(rendered).to have_text("Text")
      end
    end

    context "with block" do
      it "should render a valid label" do
        render(subject) do
          "In Block"
        end

        expect(rendered).to have_text("In Block")
      end
    end

    context "object_name is symbol" do
      let(:object_name) { :user }

      it "should render correctly" do
        expect { render(subject) }.to_not raise_error
      end
    end
  end
end
