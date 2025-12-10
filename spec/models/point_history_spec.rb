# frozen_string_literal: true

require "rails_helper"

RSpec.describe PointHistory do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:collect) }
    it { is_expected.to belong_to(:collector).class_name("User") }
  end
end
