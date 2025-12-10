# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Collect::Users", type: :request do
  let!(:admin_user) { create(:user, :admin) }
  let(:business_user) { create(:user, :business) }

  describe "GET /api/v1/collect/users" do
    it "returns a list of users" do
      get "/api/v1/collect/users", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end

    it "returns 401 without authentication" do
      get "/api/v1/collect/users"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/collect/users/:id" do
    it "returns the user" do
      get "/api/v1/collect/users/#{business_user.id}", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response[:id]).to eq(business_user.id)
    end
  end

  describe "POST /api/v1/collect/users" do
    let(:valid_params) do
      {
        user: {
          email: Faker::Internet.email,
          password: "password123",
          password_confirmation: "password123",
          role: "business"
        }
      }
    end

    it "creates a new user" do
      expect {
        post "/api/v1/collect/users", params: valid_params, headers: auth_headers_for(admin_user)
      }.to change(User, :count).by(1)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "PUT /api/v1/collect/users/:id" do
    it "updates the user" do
      new_email = Faker::Internet.email

      put "/api/v1/collect/users/#{business_user.id}",
          params: { user: { email: new_email } },
          headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(business_user.reload.email).to eq(new_email)
    end
  end

  describe "DELETE /api/v1/collect/users/:id" do
    it "deletes the user" do
      user_to_delete = create(:user, :business)

      expect {
        delete "/api/v1/collect/users/#{user_to_delete.id}", headers: auth_headers_for(admin_user)
      }.to change(User, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
