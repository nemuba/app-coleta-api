# frozen_string_literal: true

require "rails_helper"

RSpec.describe CollectSerializer, type: :serializer do
  let(:collect) { create(:collect) }
  let(:serialized_data) { described_class.new(collect).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(collect.id)
    end

    it "includes user_id" do
      expect(serialized_data[:user_id]).to eq(collect.user_id)
    end

    it "includes note" do
      expect(serialized_data[:note]).to eq(collect.note)
    end
  end

  describe "associations" do
    it "includes user association" do
      expect(serialized_data).to have_key(:user)
    end

    it "includes collect_status association" do
      expect(serialized_data).to have_key(:collect_status)
    end
  end

  it_behaves_like "a base serializer"
end
