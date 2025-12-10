# frozen_string_literal: true

require "rails_helper"

RSpec.describe RecyclableSerializer, type: :serializer do
  let(:recyclable) { create(:recyclable) }
  let(:serialized_data) { described_class.new(recyclable).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(recyclable.id)
    end

    it "includes name" do
      expect(serialized_data[:name]).to eq(recyclable.name)
    end

    it "includes unit_of_measurement" do
      expect(serialized_data[:unit_of_measurement]).to eq(recyclable.unit_of_measurement)
    end

    it "includes measure" do
      expect(serialized_data[:measure]).to eq(recyclable.measure)
    end

    it "includes point" do
      expect(serialized_data[:point]).to eq(recyclable.point)
    end
  end

  it_behaves_like "a base serializer"
end
