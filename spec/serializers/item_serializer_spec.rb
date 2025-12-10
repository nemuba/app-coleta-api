# frozen_string_literal: true

require "rails_helper"

RSpec.describe ItemSerializer, type: :serializer do
  let(:item) { create(:item) }
  let(:serialized_data) { described_class.new(item).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(item.id)
    end

    it "includes name" do
      expect(serialized_data[:name]).to eq(item.name)
    end

    it "includes point" do
      expect(serialized_data[:point]).to eq(item.point)
    end

    it "includes point_weight" do
      expect(serialized_data[:point_weight]).to eq(item.point_weight)
    end
  end

  describe "associations" do
    it "includes item_type association" do
      expect(serialized_data).to have_key(:item_type)
    end

    it "includes item_collects association" do
      expect(serialized_data).to have_key(:item_collects)
    end
  end

  it_behaves_like "a base serializer"
end
