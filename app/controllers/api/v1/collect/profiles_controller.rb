# frozen_string_literal: true

module Api
  module V1
    module Collect
      class ProfilesController < ApplicationController
        before_action :authenticate_and_set_user
        before_action :set_profile, only: %i[show update destroy]

        # GET /profiles
        def index
          @profiles = Profile.all

          authorize! :read, @profiles

          json_response(@profiles)
        end

        # GET /profiles/1
        def show
          authorize! :read, @profile

          json_response(@profile)
        end

        # POST /profiles
        def create
          @profile = current_user.profile = Profile.new(profile_params)

          if @profile.save
            json_response(@profile, :created, { location: api_v1_collect_profiles_path(@profile) })
          else
            json_response_error(@profile.errors)
          end
        end

        # PATCH/PUT /profiles/1
        def update
          authorize! :update, @profile

          if @profile.update(profile_params)
            json_response(@profile)
          else
            json_response_error(@profile.errors)
          end
        end

        # DELETE /profiles/1
        def destroy
          authorize! :destroy, @profile

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
