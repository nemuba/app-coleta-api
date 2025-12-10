# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Collect::Items", type: :request do
  let(:admin_user) { create(:user, :admin) }
  let!(:item_type) { create(:item_type) }
  let!(:item) { create(:item, item_type: item_type) }

  describe "GET /api/v1/collect/items" do
    it "returns a list of items" do
      get "/api/v1/collect/items", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end

    it "returns 401 without authentication" do
      get "/api/v1/collect/items"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/collect/items/:id" do
    it "returns the item" do
      get "/api/v1/collect/items/#{item.id}", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response[:id]).to eq(item.id)
    end
  end

  describe "POST /api/v1/collect/items" do
    let(:valid_params) do
      {
        item: {
          name: Faker::Commerce.product_name,
          point: 10,
          point_weight: 0.5,
          item_type_id: item_type.id
        }
      }
    end

    it "creates a new item" do
      expect {
        post "/api/v1/collect/items", params: valid_params, headers: auth_headers_for(admin_user)
      }.to change(Item, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /api/v1/collect/items/:id" do
    it "updates the item" do
      put "/api/v1/collect/items/#{item.id}",
          params: { item: { name: "Updated Item" } },
          headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(item.reload.name).to eq("Updated Item")
    end
  end

  describe "DELETE /api/v1/collect/items/:id" do
    it "deletes the item" do
      expect {
        delete "/api/v1/collect/items/#{item.id}", headers: auth_headers_for(admin_user)
      }.to change(Item, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
