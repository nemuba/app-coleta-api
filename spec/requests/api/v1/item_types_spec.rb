# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::ItemTypes", type: :request do
  let!(:admin_user) { create(:user, :admin) }

  before do
    itemtypes_module = SystemModule.create(name: "itemtypes", user: admin_user)
    SystemModuleUser.create(user: admin_user, system_module: itemtypes_module)
  end
  let!(:item_type) { create(:item_type) }

  describe "GET /api/v1/itemtypes" do
    it "returns a list of item types" do
      get "/api/v1/itemtypes", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end

    it "returns 401 without authentication" do
      get "/api/v1/itemtypes"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/itemtypes/:id" do
    it "returns the item type" do
      get "/api/v1/itemtypes/#{item_type.id}", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response[:id]).to eq(item_type.id)
    end
  end

  describe "POST /api/v1/itemtypes" do
    let(:valid_params) { { item_type: { name: Faker::Commerce.department } } }

    it "creates a new item type" do
      expect {
        post "/api/v1/itemtypes", params: valid_params, headers: auth_headers_for(admin_user)
      }.to change(ItemType, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /api/v1/itemtypes/:id" do
    it "updates the item type" do
      put "/api/v1/itemtypes/#{item_type.id}",
          params: { item_type: { name: "Updated Name" } },
          headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(item_type.reload.name).to eq("Updated Name")
    end
  end

  describe "DELETE /api/v1/itemtypes/:id" do
    it "deletes the item type" do
      expect {
        delete "/api/v1/itemtypes/#{item_type.id}", headers: auth_headers_for(admin_user)
      }.to change(ItemType, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
