# frozen_string_literal: true

require "rails_helper"

RSpec.describe ItemCollectSerializer, type: :serializer do
  let(:item_collect) { create(:item_collect) }
  let(:serialized_data) { described_class.new(item_collect).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(item_collect.id)
    end

    it "includes item_id" do
      expect(serialized_data[:item_id]).to eq(item_collect.item_id)
    end

    it "includes collect_id" do
      expect(serialized_data[:collect_id]).to eq(item_collect.collect_id)
    end
  end

  describe "associations" do
    it "includes collect association" do
      expect(serialized_data).to have_key(:collect)
    end
  end

  it_behaves_like "a base serializer"
end
