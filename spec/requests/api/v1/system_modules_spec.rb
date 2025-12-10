# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::SystemModules", type: :request do
  let!(:admin_user) { create(:user, :admin) }
  let(:business_user) { create(:user, :business) }
  let!(:system_module) { create(:system_module) }

  describe "GET /api/v1/systemmodules" do
    it "returns a list of system modules" do
      get "/api/v1/systemmodules", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end

    it "returns 401 without authentication" do
      get "/api/v1/systemmodules"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/systemmodules/:id" do
    it "returns the system module" do
      get "/api/v1/systemmodules/#{system_module.id}", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response[:id]).to eq(system_module.id)
    end
  end

  describe "POST /api/v1/systemmodules" do
    it "creates a new system module" do
      expect {
        post "/api/v1/systemmodules",
             params: { system_module: { name: "new_module", user_id: business_user.id } },
             headers: auth_headers_for(admin_user)
      }.to change(SystemModule, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /api/v1/systemmodules/:id" do
    it "updates the system module" do
      put "/api/v1/systemmodules/#{system_module.id}",
          params: { system_module: { name: "updated_module" } },
          headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(system_module.reload.name).to eq("updated_module")
    end
  end

  describe "DELETE /api/v1/systemmodules/:id" do
    it "deletes the system module" do
      expect {
        delete "/api/v1/systemmodules/#{system_module.id}", headers: auth_headers_for(admin_user)
      }.to change(SystemModule, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
