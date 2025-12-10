# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProductSerializer, type: :serializer do
  let(:product) { create(:product) }
  let(:serialized_data) { described_class.new(product).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(product.id)
    end

    it "includes name" do
      expect(serialized_data[:name]).to eq(product.name)
    end

    it "includes price" do
      expect(serialized_data[:price]).to eq(product.price)
    end

    it "includes point" do
      expect(serialized_data[:point]).to eq(product.point)
    end
  end

  describe "associations" do
    it "includes user association" do
      expect(serialized_data).to have_key(:user)
    end
  end

  it_behaves_like "a base serializer"
end
