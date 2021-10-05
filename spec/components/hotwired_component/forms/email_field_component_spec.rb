# frozen_string_literal: true

require "rails_helper"

RSpec.describe HotwiredComponent::Forms::EmailFieldComponent, type: :component do
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

  it "renders a password field" do
    render_inline(subject)

    expect(rendered_component).to have_css("input[type='email']")
  end
end
