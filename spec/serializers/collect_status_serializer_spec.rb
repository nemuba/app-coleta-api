# frozen_string_literal: true

require "rails_helper"

RSpec.describe CollectStatusSerializer, type: :serializer do
  let(:collect) { create(:collect) }
  let(:collect_status) { create(:collect_status, collect: collect) }
  let(:serialized_data) { described_class.new(collect_status).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(collect_status.id)
    end

    it "includes collect_id" do
      expect(serialized_data[:collect_id]).to eq(collect_status.collect_id)
    end

    it "includes name" do
      expect(serialized_data[:name]).to eq(collect_status.name)
    end
  end

  it_behaves_like "a base serializer"
end
