# frozen_string_literal: true

require "rails_helper"

# Shared examples for serializers
RSpec.shared_examples "a base serializer" do
  it "includes created_at formatted as dd/mm/yyyy" do
    expect(serialized_data[:created_at]).to match(%r{\d{2}/\d{2}/\d{4}})
  end

  it "includes updated_at formatted as dd/mm/yyyy" do
    expect(serialized_data[:updated_at]).to match(%r{\d{2}/\d{2}/\d{4}})
  end
end
