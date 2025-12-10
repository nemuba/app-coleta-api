# frozen_string_literal: true

require "rails_helper"

RSpec.describe SystemModuleUserSerializer, type: :serializer do
  let(:system_module_user) { create(:system_module_user) }
  let(:serialized_data) { described_class.new(system_module_user).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(system_module_user.id)
    end

    it "includes user_id" do
      expect(serialized_data[:user_id]).to eq(system_module_user.user_id)
    end

    it "includes system_module_id" do
      expect(serialized_data[:system_module_id]).to eq(system_module_user.system_module_id)
    end
  end

  describe "associations" do
    it "includes user association" do
      expect(serialized_data).to have_key(:user)
    end

    it "includes system_module association" do
      expect(serialized_data).to have_key(:system_module)
    end
  end

  it_behaves_like "a base serializer"
end
