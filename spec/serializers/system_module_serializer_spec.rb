# frozen_string_literal: true

require "rails_helper"

RSpec.describe SystemModuleSerializer, type: :serializer do
  let(:system_module) { create(:system_module) }
  let(:serialized_data) { described_class.new(system_module).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(system_module.id)
    end

    it "includes user_id" do
      expect(serialized_data[:user_id]).to eq(system_module.user_id)
    end

    it "includes name" do
      expect(serialized_data[:name]).to eq(system_module.name)
    end
  end

  describe "associations" do
    it "includes user association" do
      expect(serialized_data).to have_key(:user)
    end
  end

  it_behaves_like "a base serializer"
end
