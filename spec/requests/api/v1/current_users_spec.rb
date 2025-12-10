# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::CurrentUsers", type: :request do
  let(:user) { create(:user, :business) }

  describe "GET /api/v1/currentusers" do
    context "with valid authentication" do
      it "returns current user data" do
        get "/api/v1/currentusers", headers: auth_headers_for(user)

        expect(response).to have_http_status(:ok)
        expect(json_response[:id]).to eq(user.id)
        expect(json_response[:email]).to eq(user.email)
      end

      it "includes user associations" do
        get "/api/v1/currentusers", headers: auth_headers_for(user)

        expect(json_response).to have_key(:profile)
      end
    end

    context "without authentication" do
      it "returns 401" do
        get "/api/v1/currentusers"

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "with expired token" do
      it "returns 401" do
        expired_token, _refresh_token = jwt_and_refresh_token(user, "user", true)

        get "/api/v1/currentusers", headers: { "Authorization" => "Bearer #{expired_token}" }

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
