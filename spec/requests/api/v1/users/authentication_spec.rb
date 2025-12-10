# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Users::Authentication", type: :request do
  let!(:user) { create(:user, :business, email: "test@example.com") }

  let(:valid_credentials) do
    {
      auth: {
        email: "test@example.com",
        password: "password123"
      }
    }
  end

  let(:invalid_credentials) do
    {
      auth: {
        email: "test@example.com",
        password: "wrong_password"
      }
    }
  end

  describe "POST /api/v1/users/sign_in" do
    context "with valid credentials" do
      it "returns status 200" do
        post "/api/v1/users/sign_in", params: valid_credentials
        expect(response).to have_http_status(:ok)
      end

      it "returns the user data" do
        post "/api/v1/users/sign_in", params: valid_credentials
        expect(json_response[:id]).to eq(user.id)
        expect(json_response[:email]).to eq(user.email)
      end

      it "returns access token in headers" do
        post "/api/v1/users/sign_in", params: valid_credentials
        expect(response.headers["Access-Token"]).to be_present
      end

      it "returns refresh token in headers" do
        post "/api/v1/users/sign_in", params: valid_credentials
        expect(response.headers["Refresh-Token"]).to be_present
      end

      it "returns token expiration in headers" do
        post "/api/v1/users/sign_in", params: valid_credentials
        expect(response.headers["Expire-At"]).to be_present
      end
    end

    context "with invalid password" do
      it "returns status 422" do
        post "/api/v1/users/sign_in", params: invalid_credentials
        expect(response).to have_http_status(422)
      end

      it "returns error in response" do
        post "/api/v1/users/sign_in", params: invalid_credentials
        expect(json_response).to have_key(:message).or have_key(:error)
      end

      it "does not return access token" do
        post "/api/v1/users/sign_in", params: invalid_credentials
        expect(response.headers["Access-Token"]).to be_nil
      end
    end

    context "with non-existent email" do
      it "returns status 422" do
        post "/api/v1/users/sign_in", params: {
          auth: {
            email: "nonexistent@example.com",
            password: "password123"
          }
        }
        expect(response).to have_http_status(422)
      end
    end

    context "with missing parameters" do
      it "returns error when email is missing" do
        post "/api/v1/users/sign_in", params: { auth: { password: "password123" } }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /api/v1/users/sign_out" do
    context "with valid authentication using ApiGuard helper" do
      it "returns status 200" do
        # Using ApiGuard's jwt_and_refresh_token helper
        access_token, _refresh_token = jwt_and_refresh_token(user, "user")

        delete "/api/v1/users/sign_out", headers: { "Authorization" => "Bearer #{access_token}" }
        expect(response).to have_http_status(:ok)
      end

      it "returns success response" do
        access_token, _refresh_token = jwt_and_refresh_token(user, "user")

        delete "/api/v1/users/sign_out", headers: { "Authorization" => "Bearer #{access_token}" }
        expect(json_response).to have_key(:message).or have_key(:status)
      end
    end

    context "without authentication" do
      it "returns status 401" do
        delete "/api/v1/users/sign_out"
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "with invalid token" do
      it "returns status 401" do
        delete "/api/v1/users/sign_out", headers: { "Authorization" => "Bearer invalid_token" }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "with expired token using ApiGuard helper" do
      it "returns status 401 for expired token" do
        # Using ApiGuard's helper with expired: true (third parameter)
        expired_token, _refresh_token = jwt_and_refresh_token(user, "user", true)

        delete "/api/v1/users/sign_out", headers: { "Authorization" => "Bearer #{expired_token}" }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
