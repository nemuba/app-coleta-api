# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProfileSerializer, type: :serializer do
  let(:user) { create(:user, :business) }
  let(:profile) { create(:profile, user: user) }
  let(:serialized_data) { described_class.new(profile).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(profile.id)
    end

    it "includes user_id" do
      expect(serialized_data[:user_id]).to eq(profile.user_id)
    end

    it "includes name" do
      expect(serialized_data[:name]).to eq(profile.name)
    end

    it "includes phone" do
      expect(serialized_data[:phone]).to eq(profile.phone)
    end

    it "includes email" do
      expect(serialized_data[:email]).to eq(profile.email)
    end

    it "includes document" do
      expect(serialized_data[:document]).to eq(profile.document)
    end
  end

  describe "associations" do
    it "includes user association" do
      expect(serialized_data).to have_key(:user)
    end

    it "includes address association" do
      expect(serialized_data).to have_key(:address)
    end
  end

  it_behaves_like "a base serializer"
end
