# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Collect::Products", type: :request do
  let(:admin_user) { create(:user, :admin) }
  let(:user) { create_user_with_module_access(role: :business, module_name: "collect") }
  let!(:product) { create(:product, user: user) }

  describe "GET /api/v1/collect/products" do
    it "returns a list of products" do
      get "/api/v1/collect/products", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end

    it "returns 401 without authentication" do
      get "/api/v1/collect/products"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/collect/products/:id" do
    it "returns the product" do
      get "/api/v1/collect/products/#{product.id}", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response[:id]).to eq(product.id)
    end
  end

  describe "POST /api/v1/collect/products" do
    let(:valid_params) do
      {
        product: {
          name: Faker::Commerce.product_name,
          price: Faker::Commerce.price,
          point: 10,
          user_id: user.id
        }
      }
    end

    it "creates a new product" do
      expect {
        post "/api/v1/collect/products", params: valid_params, headers: auth_headers_for(admin_user)
      }.to change(Product, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /api/v1/collect/products/:id" do
    it "updates the product" do
      put "/api/v1/collect/products/#{product.id}",
          params: { product: { name: "Updated Product" } },
          headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(product.reload.name).to eq("Updated Product")
    end
  end

  describe "DELETE /api/v1/collect/products/:id" do
    it "deletes the product" do
      expect {
        delete "/api/v1/collect/products/#{product.id}", headers: auth_headers_for(admin_user)
      }.to change(Product, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
