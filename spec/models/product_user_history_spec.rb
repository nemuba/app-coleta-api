# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProductUserHistory do
  describe "associations" do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:user) }
  end

  describe "callbacks" do
    describe "#set_user_points" do
      it "deducts total_points from user's user_point value before save" do
        user = create(:user, :business)
        user_point = create(:user_point, user: user, value: 100)
        product = create(:product, user: user)

        product_history = build(:product_user_history, user: user, product: product, total_points: 30)
        product_history.save

        expect(user_point.reload.value).to eq(70)
      end
    end
  end
end
