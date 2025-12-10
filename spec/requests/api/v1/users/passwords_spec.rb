# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Users::Passwords", type: :request do
  let!(:user) { create(:user, :business, email: "password_test@example.com") }

  describe "PATCH /api/v1/users/passwords" do
    context "with valid authentication and valid parameters using ApiGuard helper" do
      it "returns status 200" do
        # Using ApiGuard's jwt_and_refresh_token helper
        access_token, _refresh_token = jwt_and_refresh_token(user, "user")

        patch "/api/v1/users/passwords",
              params: { password: "newpassword123", password_confirmation: "newpassword123" },
              headers: { "Authorization" => "Bearer #{access_token}" }
        expect(response).to have_http_status(:ok)
      end

      it "changes the user password" do
        access_token, _refresh_token = jwt_and_refresh_token(user, "user")

        patch "/api/v1/users/passwords",
              params: { password: "newpassword123", password_confirmation: "newpassword123" },
              headers: { "Authorization" => "Bearer #{access_token}" }

        # Try to sign in with old password
        post "/api/v1/users/sign_in", params: { auth: { email: user.email, password: "password123" } }
        expect(response).to have_http_status(422)

        # Sign in with new password
        post "/api/v1/users/sign_in", params: { auth: { email: user.email, password: "newpassword123" } }
        expect(response).to have_http_status(:ok)
      end

      it "returns success response" do
        access_token, _refresh_token = jwt_and_refresh_token(user, "user")

        patch "/api/v1/users/passwords",
              params: { password: "newpassword123", password_confirmation: "newpassword123" },
              headers: { "Authorization" => "Bearer #{access_token}" }
        expect(json_response).to have_key(:message).or have_key(:status)
      end

      it "returns new access token in headers" do
        access_token, _refresh_token = jwt_and_refresh_token(user, "user")

        patch "/api/v1/users/passwords",
              params: { password: "newpassword123", password_confirmation: "newpassword123" },
              headers: { "Authorization" => "Bearer #{access_token}" }
        expect(response.headers["Access-Token"]).to be_present
      end
    end

    context "with mismatched password confirmation" do
      it "returns status 422" do
        access_token, _refresh_token = jwt_and_refresh_token(user, "user")

        patch "/api/v1/users/passwords",
              params: { password: "newpassword123", password_confirmation: "different_password" },
              headers: { "Authorization" => "Bearer #{access_token}" }
        expect(response).to have_http_status(422)
      end
    end

    context "without authentication" do
      it "returns status 401" do
        patch "/api/v1/users/passwords",
              params: { password: "newpassword123", password_confirmation: "newpassword123" }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "with invalid token" do
      it "returns status 401" do
        patch "/api/v1/users/passwords",
              params: { password: "newpassword123", password_confirmation: "newpassword123" },
              headers: { "Authorization" => "Bearer invalid_token" }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "with expired token using ApiGuard helper" do
      it "returns status 401 for expired token" do
        # Using ApiGuard's helper with expired: true (third parameter)
        expired_token, _refresh_token = jwt_and_refresh_token(user, "user", true)

        patch "/api/v1/users/passwords",
              params: { password: "newpassword123", password_confirmation: "newpassword123" },
              headers: { "Authorization" => "Bearer #{expired_token}" }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
