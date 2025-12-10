# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserPoint do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end
end
