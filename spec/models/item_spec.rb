# frozen_string_literal: true

require "rails_helper"

RSpec.describe Item do
  describe "associations" do
    it { is_expected.to belong_to(:item_type) }
    it { is_expected.to have_many(:item_collects) }
  end

  describe "nested attributes" do
    it { is_expected.to accept_nested_attributes_for(:item_collects).allow_destroy(true) }
  end
end
