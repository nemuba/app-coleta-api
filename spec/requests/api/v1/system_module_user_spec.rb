# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::SystemModuleUser", type: :request do
  let!(:admin_user) { create(:user, :admin) }
  let!(:business_user) { create(:user, :business) }
  let!(:system_module) { create(:system_module) }
  let!(:system_module_user) { create(:system_module_user, user: business_user, system_module: system_module) }

  describe "GET /api/v1/systemmoduleuser" do
    it "returns a list of system module users" do
      get "/api/v1/systemmoduleuser", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end

    it "returns 401 without authentication" do
      get "/api/v1/systemmoduleuser"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/systemmoduleuser/:id" do
    it "returns the system module user" do
      get "/api/v1/systemmoduleuser/#{system_module_user.id}", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response[:id]).to eq(system_module_user.id)
    end
  end

  describe "POST /api/v1/systemmoduleuser" do
    let(:other_system_module) { create(:system_module) }
    let(:valid_params) do
      {
        system_module_user: {
          user_id: business_user.id,
          system_module_id: other_system_module.id
        }
      }
    end

    it "creates a new system module user" do
      expect {
        post "/api/v1/systemmoduleuser", params: valid_params, headers: auth_headers_for(admin_user)
      }.to change(SystemModuleUser, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE /api/v1/systemmoduleuser/:id" do
    it "deletes the system module user" do
      expect {
        delete "/api/v1/systemmoduleuser/#{system_module_user.id}", headers: auth_headers_for(admin_user)
      }.to change(SystemModuleUser, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
