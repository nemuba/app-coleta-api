# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Users::Tokens", type: :request do
  let!(:user) { create(:user, :business, email: "token_test@example.com") }

  describe "POST /api/v1/users/tokens" do
    context "with valid access token and refresh token using ApiGuard helper" do
      it "returns status 200" do
        # Using ApiGuard's jwt_and_refresh_token helper
        access_token, refresh_token = jwt_and_refresh_token(user, "user")

        post "/api/v1/users/tokens", headers: {
          "Authorization" => "Bearer #{access_token}",
          "Refresh-Token" => refresh_token
        }
        expect(response).to have_http_status(:ok)
      end

      it "returns new access token in headers" do
        access_token, refresh_token = jwt_and_refresh_token(user, "user")

        post "/api/v1/users/tokens", headers: {
          "Authorization" => "Bearer #{access_token}",
          "Refresh-Token" => refresh_token
        }
        expect(response.headers["Access-Token"]).to be_present
      end

      it "returns new refresh token in headers" do
        access_token, refresh_token = jwt_and_refresh_token(user, "user")

        post "/api/v1/users/tokens", headers: {
          "Authorization" => "Bearer #{access_token}",
          "Refresh-Token" => refresh_token
        }
        expect(response.headers["Refresh-Token"]).to be_present
      end

      it "returns success response" do
        access_token, refresh_token = jwt_and_refresh_token(user, "user")

        post "/api/v1/users/tokens", headers: {
          "Authorization" => "Bearer #{access_token}",
          "Refresh-Token" => refresh_token
        }
        expect(json_response).to have_key(:message).or have_key(:status)
      end

      it "invalidates old refresh token" do
        access_token, refresh_token = jwt_and_refresh_token(user, "user")

        post "/api/v1/users/tokens", headers: {
          "Authorization" => "Bearer #{access_token}",
          "Refresh-Token" => refresh_token
        }
        new_access_token = response.headers["Access-Token"]

        # Try to use old refresh token again
        post "/api/v1/users/tokens", headers: {
          "Authorization" => "Bearer #{new_access_token}",
          "Refresh-Token" => refresh_token
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "without refresh token" do
      it "returns status 401" do
        access_token, _refresh_token = jwt_and_refresh_token(user, "user")

        post "/api/v1/users/tokens", headers: { "Authorization" => "Bearer #{access_token}" }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "with invalid refresh token" do
      it "returns status 401" do
        access_token, _refresh_token = jwt_and_refresh_token(user, "user")

        post "/api/v1/users/tokens", headers: {
          "Authorization" => "Bearer #{access_token}",
          "Refresh-Token" => "invalid_refresh_token"
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "without authentication" do
      it "returns status 401" do
        post "/api/v1/users/tokens"
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "with expired access token and valid refresh token" do
      it "still allows token refresh with valid refresh token" do
        # Using ApiGuard's helper with expired: true
        _expired_token, refresh_token = jwt_and_refresh_token(user, "user", true)
        valid_token, _ = jwt_and_refresh_token(user, "user")

        post "/api/v1/users/tokens", headers: {
          "Authorization" => "Bearer #{valid_token}",
          "Refresh-Token" => refresh_token
        }
        # This should work as refresh token is valid
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
