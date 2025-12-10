# frozen_string_literal: true

require "rails_helper"

RSpec.describe BaseSerializer, type: :serializer do
  let(:user) { create(:user, :business) }

  describe "date formatting" do
    let(:serialized_data) { described_class.new(user).as_json }

    it "formats created_at as dd/mm/yyyy" do
      expect(serialized_data[:created_at]).to match(%r{\d{2}/\d{2}/\d{4}})
    end

    it "formats updated_at as dd/mm/yyyy" do
      expect(serialized_data[:updated_at]).to match(%r{\d{2}/\d{2}/\d{4}})
    end

    it "returns correct date format" do
      today = Time.zone.today.strftime("%d/%m/%Y")
      expect(serialized_data[:created_at]).to eq(today)
    end
  end
end
