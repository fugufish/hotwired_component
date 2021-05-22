# frozen_string_literal: true

require "rails_helper"
RSpec.describe HotwiredComponent::Tw::Forms::SubmitButtonComponent,
  type: :view do
  let(:value) { "Sign Up" }
  let(:options) { {} }

  subject { described_class.new(value: value, options: options) }

  describe "render" do
    context "with value" do
      it "should render the button" do
        render(subject)

        expect(rendered).to have_css(
          ".daisy-forms-submit_button.form-control.pt-3" \
          "[data-controller='daisy--forms--submit_button--component'] >" \
          "input.btn[type='submit'][value='Sign Up']"
        )
      end
    end

    context "with options" do
    end
  end
end
 