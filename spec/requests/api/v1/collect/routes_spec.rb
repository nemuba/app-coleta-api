# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Collect::Routes", type: :request do
  let(:admin_user) { create(:user, :admin) }
  let(:user) { create_user_with_module_access(role: :collector, module_name: "collect") }
  let!(:route) { create(:route, user: user) }

  describe "GET /api/v1/collect/routes" do
    it "returns a list of routes" do
      get "/api/v1/collect/routes", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end

    it "returns 401 without authentication" do
      get "/api/v1/collect/routes"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/collect/routes/:id" do
    it "returns the route" do
      get "/api/v1/collect/routes/#{route.id}", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response[:id]).to eq(route.id)
    end
  end

  describe "POST /api/v1/collect/routes" do
    let(:valid_params) do
      {
        route: {
          user_id: user.id,
          collect_date: Date.tomorrow,
          request_date: Time.current,
          status: :pending
        }
      }
    end

    it "creates a new route" do
      expect {
        post "/api/v1/collect/routes", params: valid_params, headers: auth_headers_for(admin_user)
      }.to change(Route, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /api/v1/collect/routes/:id" do
    it "updates the route" do
      put "/api/v1/collect/routes/#{route.id}",
          params: { route: { status: :finished } },
          headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(route.reload.status).to eq("finished")
    end
  end

  describe "DELETE /api/v1/collect/routes/:id" do
    it "deletes the route" do
      expect {
        delete "/api/v1/collect/routes/#{route.id}", headers: auth_headers_for(admin_user)
      }.to change(Route, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
