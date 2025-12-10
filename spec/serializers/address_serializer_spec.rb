# frozen_string_literal: true

require "rails_helper"

RSpec.describe AddressSerializer, type: :serializer do
  let(:user) { create(:user, :business) }
  let(:profile) { create(:profile, user: user) }
  let(:address) { create(:address, profile: profile) }
  let(:serialized_data) { described_class.new(address).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(address.id)
    end

    it "includes street" do
      expect(serialized_data[:street]).to eq(address.street)
    end

    it "includes number" do
      expect(serialized_data[:number]).to eq(address.number)
    end

    it "includes neighborhood" do
      expect(serialized_data[:neighborhood]).to eq(address.neighborhood)
    end

    it "includes city" do
      expect(serialized_data[:city]).to eq(address.city)
    end

    it "includes state" do
      expect(serialized_data[:state]).to eq(address.state)
    end

    it "includes country" do
      expect(serialized_data[:country]).to eq(address.country)
    end

    it "includes zip_code" do
      expect(serialized_data[:zip_code]).to eq(address.zip_code)
    end

    it "includes latitude" do
      expect(serialized_data[:latitude]).to eq(address.latitude)
    end

    it "includes longitude" do
      expect(serialized_data[:longitude]).to eq(address.longitude)
    end
  end

  it_behaves_like "a base serializer"
end
