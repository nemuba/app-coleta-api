# frozen_string_literal: true

require "rails_helper"

RSpec.describe ItemType do
  describe "factory" do
    it "creates a valid item_type" do
      item_type = create(:item_type)
      expect(item_type).to be_persisted
    end
  end
end
