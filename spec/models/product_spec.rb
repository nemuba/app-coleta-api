# frozen_string_literal: true

require "rails_helper"

RSpec.describe Product do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:product_user_histories).dependent(:destroy) }
  end
end
