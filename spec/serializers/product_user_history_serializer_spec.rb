# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProductUserHistorySerializer, type: :serializer do
  let(:user) { create(:user, :business) }
  let!(:user_point) { create(:user_point, user: user, value: 1000) }
  let(:product) { create(:product, user: user) }
  let(:product_user_history) { create(:product_user_history, user: user, product: product) }
  let(:serialized_data) { described_class.new(product_user_history).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(product_user_history.id)
    end

    it "includes quantity" do
      expect(serialized_data[:quantity]).to eq(product_user_history.quantity)
    end

    it "includes total_points" do
      expect(serialized_data[:total_points]).to eq(product_user_history.total_points)
    end

    it "includes user_points" do
      expect(serialized_data[:user_points]).to eq(product_user_history.user_points)
    end
  end

  describe "associations" do
    it "includes product association" do
      expect(serialized_data).to have_key(:product)
    end

    it "includes user association" do
      expect(serialized_data).to have_key(:user)
    end
  end

  it_behaves_like "a base serializer"
end
