# frozen_string_literal: true

module Api
  module V1
    module Collect
      class CollectsController < ApplicationController
        before_action :authenticate_and_set_user
        before_action :set_collect, only: [:show, :update, :destroy]
        load_and_authorize_resource

        INCLUDES = ["user", "user.profile", "user.profile.address", "collect_status"].freeze

        # GET /collects
        def index
          @collects = ::Collect.includes(INCLUDES)

          render json: @collects, include: INCLUDES
        end

        # GET /collects/1
        def show
          render json: @collects, include: INCLUDES
        end

        # POST /collects
        def create
          @collect = current_user.collects.build(collect_params)

          if @collect.save
            render json: @collect, status: :created, include: INCLUDES
          else
            json_response_error(@collect.errors)
          end
        end

        # PATCH/PUT /collects/1
        def update
          if @collect.update(collect_params)
            render json: @collect, include: INCLUDES
          else
            json_response_error(@collect.errors)
          end
        end

        # DELETE /collects/1
        def destroy
          @collect.destroy
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_collect
            @collect = ::Collect.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def collect_params
            params.require(:collect).permit(
              :user_id,
              :note,
              collect_status_attributes: [:id, :name, :_destroy]
            )
          end
      end
    end
  end
end
