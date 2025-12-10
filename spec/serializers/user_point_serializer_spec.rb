# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserPointSerializer, type: :serializer do
  let(:user_point) { create(:user_point) }
  let(:serialized_data) { described_class.new(user_point).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(user_point.id)
    end

    it "includes user_id" do
      expect(serialized_data[:user_id]).to eq(user_point.user_id)
    end

    it "includes value" do
      expect(serialized_data[:value]).to eq(user_point.value)
    end
  end

  it_behaves_like "a base serializer"
end
