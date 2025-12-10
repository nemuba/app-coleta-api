# frozen_string_literal: true

require "rails_helper"

RSpec.describe Recyclable do
  describe "enums" do
    it { is_expected.to define_enum_for(:unit_of_measurement).with_values(gram: 0, kilogram: 1, unity: 2) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:unit_of_measurement) }
    it { is_expected.to validate_presence_of(:measure) }
    it { is_expected.to validate_presence_of(:point) }
    it { is_expected.to validate_numericality_of(:point).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:measure).is_greater_than_or_equal_to(0) }
  end

  describe "factory" do
    it "creates a valid recyclable" do
      recyclable = create(:recyclable)
      expect(recyclable).to be_persisted
    end
  end
end
