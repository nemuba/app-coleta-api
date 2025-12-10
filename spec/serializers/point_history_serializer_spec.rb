# frozen_string_literal: true

require "rails_helper"

RSpec.describe PointHistorySerializer, type: :serializer do
  let(:point_history) { create(:point_history) }
  let(:serialized_data) { described_class.new(point_history).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(point_history.id)
    end

    it "includes value" do
      expect(serialized_data[:value]).to eq(point_history.value)
    end
  end

  describe "associations" do
    it "includes user association" do
      expect(serialized_data).to have_key(:user)
    end

    it "includes collector association" do
      expect(serialized_data).to have_key(:collector)
    end

    it "includes collect association" do
      expect(serialized_data).to have_key(:collect)
    end
  end

  it_behaves_like "a base serializer"
end
