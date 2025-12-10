# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserSerializer, type: :serializer do
  let(:user) { create(:user, :business) }
  let(:serialized_data) { described_class.new(user).as_json }

  describe "attributes" do
    it "includes id" do
      expect(serialized_data[:id]).to eq(user.id)
    end

    it "includes email" do
      expect(serialized_data[:email]).to eq(user.email)
    end

    it "includes role" do
      expect(serialized_data[:role]).to eq(user.role)
    end

    it "includes token" do
      expect(serialized_data).to have_key(:token)
    end
  end

  describe "associations" do
    it "includes profile association" do
      expect(serialized_data).to have_key(:profile)
    end

    it "includes routes association" do
      expect(serialized_data).to have_key(:routes)
    end

    it "includes products association" do
      expect(serialized_data).to have_key(:products)
    end

    it "includes collects association" do
      expect(serialized_data).to have_key(:collects)
    end

    it "includes user_modules association" do
      expect(serialized_data).to have_key(:user_modules)
    end

    it "includes system_module_users association" do
      expect(serialized_data).to have_key(:system_module_users)
    end

    it "includes user_point association" do
      expect(serialized_data).to have_key(:user_point)
    end

    it "includes product_user_histories association" do
      expect(serialized_data).to have_key(:product_user_histories)
    end
  end

  it_behaves_like "a base serializer"
end
