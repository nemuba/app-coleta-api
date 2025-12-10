# frozen_string_literal: true

require "rails_helper"

RSpec.describe RouteCollectSerializer, type: :serializer do
  let(:route_collect) { create(:route_collect) }
  let(:serialized_data) { described_class.new(route_collect).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(route_collect.id)
    end

    it "includes collect_id" do
      expect(serialized_data[:collect_id]).to eq(route_collect.collect_id)
    end

    it "includes route_id" do
      expect(serialized_data[:route_id]).to eq(route_collect.route_id)
    end

    it "includes order" do
      expect(serialized_data[:order]).to eq(route_collect.order)
    end
  end

  describe "associations" do
    it "includes collect association" do
      expect(serialized_data).to have_key(:collect)
    end
  end

  it_behaves_like "a base serializer"
end
