# frozen_string_literal: true

Rspec.describe HotwiredComponent::Forms::BaseComponent, type: :component do
  it "rendered component" do
    render_inline(described_class.new)

    # expect(rendered_component).to have_text "hello"
  end
end 
