# frozen_string_literal: true

require "rails_helper"

RSpec.describe Route do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:route_collects).dependent(:destroy) }
  end

  describe "enums" do
    it { is_expected.to define_enum_for(:status).with_values(pending: 0, finished: 1) }
  end

  describe "nested attributes" do
    it { is_expected.to accept_nested_attributes_for(:route_collects).allow_destroy(true) }
  end
end
