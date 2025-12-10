# frozen_string_literal: true

require "rails_helper"

RSpec.describe Profile do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one(:address).dependent(:destroy) }
  end

  describe "nested attributes" do
    it { is_expected.to accept_nested_attributes_for(:address).allow_destroy(true) }
  end

  describe "#treat_phone" do
    it "removes non-numeric characters from phone before save" do
      user = create(:user, :business)
      profile = build(:profile, user: user, phone: "(11) 99999-9999")
      profile.save
      expect(profile.phone).to eq("11999999999")
    end

    it "removes all non-numeric characters from any phone format" do
      user = create(:user, :business)
      profile = create(:profile, user: user)
      # Phone should only contain digits after save
      expect(profile.phone).to match(/\A\d+\z/)
    end
  end
end
