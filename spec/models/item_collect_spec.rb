# frozen_string_literal: true

require "rails_helper"

RSpec.describe ItemCollect do
  describe "associations" do
    it { is_expected.to belong_to(:item) }
    it { is_expected.to belong_to(:collect) }
  end
end
