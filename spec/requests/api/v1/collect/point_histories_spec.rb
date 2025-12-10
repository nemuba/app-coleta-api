# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Collect::PointHistories", type: :request do
  let(:admin_user) { create(:user, :admin) }
  let(:collector_user) { create(:user, :collector) }
  let(:customer_user) { create(:user, :customer) }
  let!(:collect_record) { create(:collect, user: customer_user) }
  let!(:point_history) { create(:point_history, user: customer_user, collector: collector_user, collect: collect_record) }

  describe "GET /api/v1/collect/point_histories" do
    it "returns a list of point histories" do
      get "/api/v1/collect/point_histories", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end

    it "returns 401 without authentication" do
      get "/api/v1/collect/point_histories"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/collect/point_histories/:id" do
    it "returns the point history" do
      get "/api/v1/collect/point_histories/#{point_history.id}", headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(json_response[:id]).to eq(point_history.id)
    end
  end

  describe "POST /api/v1/collect/point_histories" do
    let(:new_collect) { create(:collect, user: customer_user) }
    let(:valid_params) do
      {
        point_history: {
          user_id: customer_user.id,
          collector_id: collector_user.id,
          collect_id: new_collect.id,
          value: 50
        }
      }
    end

    it "creates a new point history" do
      expect {
        post "/api/v1/collect/point_histories", params: valid_params, headers: auth_headers_for(admin_user)
      }.to change(PointHistory, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /api/v1/collect/point_histories/:id" do
    it "updates the point history" do
      put "/api/v1/collect/point_histories/#{point_history.id}",
          params: { point_history: { value: 100 } },
          headers: auth_headers_for(admin_user)

      expect(response).to have_http_status(:ok)
      expect(point_history.reload.value).to eq(100)
    end
  end

  describe "DELETE /api/v1/collect/point_histories/:id" do
    it "deletes the point history" do
      expect {
        delete "/api/v1/collect/point_histories/#{point_history.id}", headers: auth_headers_for(admin_user)
      }.to change(PointHistory, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
