# frozen_string_literal: true

class MockModel
  include ActiveModel::Model

  attr_accessor :field, :errors

  def initialize(errors: {})
    @errors = errors
  end
end
