# frozen_string_literal: true

require "rails_helper"

RSpec.describe Address do
  describe "associations" do
    it { is_expected.to belong_to(:profile) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
  end

  describe "#address" do
    it "returns formatted address" do
      address = build(:address,
                      number: "100",
                      street: "Rua A",
                      neighborhood: "Centro",
                      city: "São Paulo",
                      state: "SP")
      expect(address.address).to eq("100, Rua A, Centro, São Paulo, SP")
    end

    it "formats address with faker data" do
      address = build(:address)
      formatted = address.address
      expect(formatted).to include(address.number)
      expect(formatted).to include(address.street)
      expect(formatted).to include(address.city)
    end
  end
end
