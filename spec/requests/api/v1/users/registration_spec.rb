# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Users::Registration", type: :request do
  let(:valid_params) do
    {
      auth: {
        email: Faker::Internet.email,
        password: "password123",
        password_confirmation: "password123",
        role: "customer"
      }
    }
  end

  let(:invalid_params) do
    {
      auth: {
        email: "",
        password: "password123",
        password_confirmation: "password123"
      }
    }
  end

  describe "POST /api/v1/users/sign_up" do
    context "with valid parameters" do
      it "creates a new user" do
        expect {
          post "/api/v1/users/sign_up", params: valid_params
        }.to change(User, :count).by(1)
      end

      it "returns status 200" do
        post "/api/v1/users/sign_up", params: valid_params
        expect(response).to have_http_status(:ok)
      end

      it "returns the user data" do
        post "/api/v1/users/sign_up", params: valid_params
        expect(json_response).to have_key(:id)
        expect(json_response).to have_key(:email)
      end

      it "returns access token in headers" do
        post "/api/v1/users/sign_up", params: valid_params
        expect(response.headers["Access-Token"]).to be_present
      end

      it "returns refresh token in headers" do
        post "/api/v1/users/sign_up", params: valid_params
        expect(response.headers["Refresh-Token"]).to be_present
      end
    end

    context "with invalid parameters" do
      it "does not create a new user" do
        expect {
          post "/api/v1/users/sign_up", params: invalid_params
        }.not_to change(User, :count)
      end

      it "returns status 422" do
        post "/api/v1/users/sign_up", params: invalid_params
        expect(response).to have_http_status(422)
      end

      it "returns error messages" do
        post "/api/v1/users/sign_up", params: invalid_params
        expect(json_response).to have_key(:error)
      end
    end

    context "with duplicate email" do
      before { create(:user, email: "duplicate@example.com") }

      it "returns status 422" do
        post "/api/v1/users/sign_up", params: {
          auth: {
            email: "duplicate@example.com",
            password: "password123",
            password_confirmation: "password123"
          }
        }
        expect(response).to have_http_status(422)
      end
    end

    context "with mismatched password confirmation" do
      it "returns status 422" do
        post "/api/v1/users/sign_up", params: {
          auth: {
            email: Faker::Internet.email,
            password: "password123",
            password_confirmation: "different_password"
          }
        }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /api/v1/users/delete" do
    let(:user) { create(:user, :business) }

    context "with valid authentication using ApiGuard helper" do
      it "deletes the user" do
        # Using ApiGuard's jwt_and_refresh_token helper
        access_token, _refresh_token = jwt_and_refresh_token(user, "user")

        expect {
          delete "/api/v1/users/delete", headers: { "Authorization" => "Bearer #{access_token}" }
        }.to change(User, :count).by(-1)
      end

      it "returns status 200" do
        access_token, _refresh_token = jwt_and_refresh_token(user, "user")

        delete "/api/v1/users/delete", headers: { "Authorization" => "Bearer #{access_token}" }
        expect(response).to have_http_status(:ok)
      end

      it "returns success message" do
        access_token, _refresh_token = jwt_and_refresh_token(user, "user")

        delete "/api/v1/users/delete", headers: { "Authorization" => "Bearer #{access_token}" }
        expect(json_response[:message]).to be_present
      end
    end

    context "without authentication" do
      it "returns status 401" do
        delete "/api/v1/users/delete"
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
