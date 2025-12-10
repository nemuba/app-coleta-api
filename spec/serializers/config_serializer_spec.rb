# frozen_string_literal: true

require "rails_helper"

RSpec.describe ConfigSerializer, type: :serializer do
  let(:config) { create(:config) }
  let(:serialized_data) { described_class.new(config).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(config.id)
    end

    it "includes param" do
      expect(serialized_data[:param]).to eq(config.param)
    end

    it "includes value" do
      expect(serialized_data[:value]).to eq(config.value)
    end
  end

  describe "associations" do
    it "includes system_module association" do
      expect(serialized_data).to have_key(:system_module)
    end
  end

  it_behaves_like "a base serializer"
end
