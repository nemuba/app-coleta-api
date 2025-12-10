# frozen_string_literal: true

require "rails_helper"

RSpec.describe Config do
  describe "associations" do
    it { is_expected.to belong_to(:system_module) }
  end
end
