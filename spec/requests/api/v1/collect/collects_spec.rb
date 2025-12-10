# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Collect::Collects", type: :request do
  let(:admin_user) { create(:user, :admin) }
  let(:user) { create_user_with_module_access(role: :business, module_name: "collect") }
  let!(:collect_record) { create(:collect, user: user) }

  describe "GET /api/v1/collect/collects" do
    it "returns a list of collects" do
      get "/api/v1/collect/collects", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end

    it "returns 401 without authentication" do
      get "/api/v1/collect/collects"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/collect/collects/:id" do
    it "returns the collect" do
      get "/api/v1/collect/collects/#{collect_record.id}", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response[:id]).to eq(collect_record.id)
    end
  end

  describe "POST /api/v1/collect/collects" do
    let(:valid_params) do
      {
        collect: {
          user_id: user.id,
          note: Faker::Lorem.sentence,
          collect_status_attributes: { name: "Pending" }
        }
      }
    end

    it "creates a new collect" do
      expect {
        post "/api/v1/collect/collects", params: valid_params, headers: auth_headers_for(admin_user)
      }.to change(Collect, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /api/v1/collect/collects/:id" do
    it "updates the collect" do
      put "/api/v1/collect/collects/#{collect_record.id}",
          params: { collect: { note: "Updated note" } },
          headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(collect_record.reload.note).to eq("Updated note")
    end
  end

  describe "DELETE /api/v1/collect/collects/:id" do
    it "deletes the collect" do
      expect {
        delete "/api/v1/collect/collects/#{collect_record.id}", headers: auth_headers_for(admin_user)
      }.to change(Collect, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
