# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Recyclables", type: :request do
  let!(:recyclable) { create(:recyclable) }

  describe "GET /api/v1/recyclables" do
    it "returns a list of recyclables" do
      get "/api/v1/recyclables"

      expect(response).to have_http_status(:ok)
      expect(json_response).to be_an(Array)
    end
  end

  describe "GET /api/v1/recyclables/:id" do
    it "returns the recyclable" do
      get "/api/v1/recyclables/#{recyclable.id}"

      expect(response).to have_http_status(:ok)
      expect(json_response[:id]).to eq(recyclable.id)
    end

    it "returns error for non-existent recyclable" do
      get "/api/v1/recyclables/999999"

      expect(response).to have_http_status(422)
    end
  end

  describe "POST /api/v1/recyclables" do
    let(:valid_params) do
      {
        recyclable: {
          name: Faker::Science.element,
          unit_of_measurement: :kilogram,
          measure: 1.5,
          point: 10
        }
      }
    end

    it "creates a new recyclable" do
      expect {
        post "/api/v1/recyclables", params: valid_params
      }.to change(Recyclable, :count).by(1)

      expect(response).to have_http_status(:created)
    end

    it "returns error for invalid params" do
      post "/api/v1/recyclables", params: { recyclable: { name: "" } }

      expect(response).to have_http_status(422)
    end
  end

  describe "PUT /api/v1/recyclables/:id" do
    it "updates the recyclable" do
      put "/api/v1/recyclables/#{recyclable.id}",
          params: { recyclable: { name: "Updated Name" } }

      expect(response).to have_http_status(:ok)
      expect(recyclable.reload.name).to eq("Updated Name")
    end
  end

  describe "DELETE /api/v1/recyclables/:id" do
    it "deletes the recyclable" do
      expect {
        delete "/api/v1/recyclables/#{recyclable.id}"
      }.to change(Recyclable, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
