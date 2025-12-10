# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Collect::Customers", type: :request do
  let(:admin_user) { create(:user, :admin) }
  let(:customer_user) { User.create!(email: Faker::Internet.email, password: "password123", role: :customer) }
  let!(:customer) { Customer.find(customer_user.id) }

  describe "GET /api/v1/collect/customers" do
    it "returns a list of customers" do
      get "/api/v1/collect/customers", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end

    it "returns 401 without authentication" do
      get "/api/v1/collect/customers"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/collect/customers/:id" do
    it "returns the customer" do
      get "/api/v1/collect/customers/#{customer.id}", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response[:id]).to eq(customer.id)
    end
  end

  describe "POST /api/v1/collect/customers" do
    let(:valid_params) do
      {
        customer: {
          email: Faker::Internet.email,
          password: "password123",
          password_confirmation: "password123",
          role: "customer"
        }
      }
    end

    it "creates a new customer" do
      expect {
        post "/api/v1/collect/customers", params: valid_params, headers: auth_headers_for(admin_user)
      }.to change(Customer, :count).by(1)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "PUT /api/v1/collect/customers/:id" do
    it "updates the customer" do
      new_email = Faker::Internet.email

      put "/api/v1/collect/customers/#{customer.id}",
          params: { customer: { email: new_email } },
          headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(customer.reload.email).to eq(new_email)
    end
  end

  describe "DELETE /api/v1/collect/customers/:id" do
    it "deletes the customer" do
      expect {
        delete "/api/v1/collect/customers/#{customer.id}", headers: auth_headers_for(admin_user)
      }.to change(Customer, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
