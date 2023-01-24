# frozen_string_literal: true

module Api
  module V1
    module Collect
      class RoutesController < ApplicationController
        before_action :authenticate_and_set_user
        before_action :set_route, only: [:show, :update, :destroy]
        load_and_authorize_resource

        INCLUDES = ["user", "route_collects", "route_collects.collect"]

        # GET /routes
        def index
          routes = Route.all

          render json: routes, include: INCLUDES
        end

        # GET /routes/1
        def show
          render json: @route, include: INCLUDES
        end

        # POST /routes
        def create
          route = Route.new(route_params)

          if route.save
            render json: route, status: :created, include: INCLUDES
          else
            render json: route.errors, status: :unprocessable_entity, include: INCLUDES
          end
        end

        # PATCH/PUT /routes/1
        def update
          if @route.update(route_params)
            render json: @route, status: :created, include: INCLUDES
          else
            render json: @route.errors, status: :unprocessable_entity, include: INCLUDES
          end
        end

        # DELETE /routes/1
        def destroy
          @route.destroy
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_route
            @route = Route.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def route_params
            params.require(:route).permit(
              :user_id,
              :collect_date,
              :request_date,
              :status,
              route_collects_attributes: [:id, :collect_id, :order, :_destroy]
            )
          end
      end
    end
  end
end
