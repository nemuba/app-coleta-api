# frozen_string_literal: true

require "rails_helper"

RSpec.describe ItemTypeSerializer, type: :serializer do
  let(:item_type) { create(:item_type) }
  let(:serialized_data) { described_class.new(item_type).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(item_type.id)
    end

    it "includes name" do
      expect(serialized_data[:name]).to eq(item_type.name)
    end
  end

  it_behaves_like "a base serializer"
end
