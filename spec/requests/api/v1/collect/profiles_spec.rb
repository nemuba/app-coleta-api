# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Collect::Profiles", type: :request do
  let(:admin_user) { create(:user, :admin) }
  let(:user) { create_user_with_module_access(role: :business, module_name: "collect") }
  let!(:profile) { create(:profile, user: user) }

  describe "GET /api/v1/collect/profiles" do
    it "returns a list of profiles" do
      get "/api/v1/collect/profiles", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end

    it "returns 401 without authentication" do
      get "/api/v1/collect/profiles"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/collect/profiles/:id" do
    it "returns the profile" do
      get "/api/v1/collect/profiles/#{profile.id}", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response[:id]).to eq(profile.id)
    end
  end

  describe "POST /api/v1/collect/profiles" do
    let(:other_user) { create(:user, :business) }
    let(:valid_params) do
      {
        profile: {
          user_id: other_user.id,
          name: Faker::Name.name,
          phone: Faker::PhoneNumber.cell_phone,
          email: Faker::Internet.email,
          document: Faker::Number.number(digits: 11).to_s
        }
      }
    end

    it "creates a new profile" do
      expect {
        post "/api/v1/collect/profiles", params: valid_params, headers: auth_headers_for(admin_user)
      }.to change(Profile, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /api/v1/collect/profiles/:id" do
    it "updates the profile" do
      put "/api/v1/collect/profiles/#{profile.id}",
          params: { profile: { name: "Updated Name" } },
          headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(profile.reload.name).to eq("Updated Name")
    end
  end

  describe "DELETE /api/v1/collect/profiles/:id" do
    it "deletes the profile" do
      expect {
        delete "/api/v1/collect/profiles/#{profile.id}", headers: auth_headers_for(admin_user)
      }.to change(Profile, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
