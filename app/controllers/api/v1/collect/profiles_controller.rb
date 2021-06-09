# frozen_string_literal: true

module Api
  module V1
    module Collect
      class ProfilesController < ApplicationController
        before_action :authenticate_and_set_user
        before_action :set_profile, only: %i[show update destroy]
        load_and_authorize_resource

        # GET /profiles
        def index
          @profiles = Profile.all

          json_response(@profiles)
        end

        # GET /profiles/1
        def show
          json_response(@profile)
        end

        # POST /profiles
        def create
          @profile = current_user.build_profile(profile_params)

          if @profile.save
            json_response(@profile, :created)
          else
            json_response_error(@profile.errors)
          end
        end

        # PATCH/PUT /profiles/1
        def update
          if @profile.update(profile_params)
            json_response(@profile)
          else
            json_response_error(@profile.errors)
          end
        end

        # DELETE /profiles/1
        def destroy
          @profile.destroy
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_profile
            @profile = Profile.find(params[:id])
          end

          # Only allow a trusted parameter "white list" through.
          def profile_params
            params.require(:profile).permit(
              :name,
              :phone,
              :email,
              :document,
              address_attributes: %i[
                id
                street
                number
                neighborhood
                city
                country
                zip_code
                latitude
                longitude
                _destroy
              ]
            )
          end
      end
    end
  end
end
