# frozen_string_literal: true

require "rails_helper"

RSpec.describe RouteCollect do
  describe "associations" do
    it { is_expected.to belong_to(:route) }
    it { is_expected.to belong_to(:collect) }
  end
end
