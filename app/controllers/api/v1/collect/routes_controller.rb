# frozen_string_literal: true

module Api
  module V1
    module Collect
      class RoutesController < ApplicationController
        before_action :authenticate_and_set_user
        before_action :set_route, only: [:show, :update, :destroy]
        load_and_authorize_resource

        # GET /routes
        def index
          routes = Route.all

          json_response(routes)
        end

        # GET /routes/1
        def show
          json_response(@route)
        end

        # POST /routes
        def create
          route = current_user.routes.build(route_params)

          if route.save
            json_response(route, :created)
          else
            json_response_error(route.errors)
          end
        end

        # PATCH/PUT /routes/1
        def update
          if @route.update(route_params)
            json_response(@route)
          else
            json_response_error(@route.errors)
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
              :date_collect,
              :date_start,
              :date_finish,
              route_collects_attributes: [:id, :collect_id, :order, :_destroy]
            )
          end
      end
    end
  end
end
