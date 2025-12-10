# frozen_string_literal: true

require "rails_helper"

RSpec.describe RouteSerializer, type: :serializer do
  let(:route) { create(:route) }
  let(:serialized_data) { described_class.new(route).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(route.id)
    end

    it "includes user_id" do
      expect(serialized_data[:user_id]).to eq(route.user_id)
    end

    it "includes status" do
      expect(serialized_data[:status]).to eq(route.status)
    end
  end

  describe "date formatting" do
    it "formats collect_date as yyyy-mm-dd" do
      expect(serialized_data[:collect_date]).to match(/\d{4}-\d{2}-\d{2}/)
    end

    it "formats request_date as yyyy-mm-dd" do
      expect(serialized_data[:request_date]).to match(/\d{4}-\d{2}-\d{2}/)
    end
  end

  describe "associations" do
    it "includes user association" do
      expect(serialized_data).to have_key(:user)
    end

    it "includes route_collects association" do
      expect(serialized_data).to have_key(:route_collects)
    end
  end

  it_behaves_like "a base serializer"
end
