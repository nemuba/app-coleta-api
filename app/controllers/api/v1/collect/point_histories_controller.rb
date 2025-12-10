# frozen_string_literal: true

module Api
  module V1
    module Collect
      class PointHistoriesController < ApplicationController
        before_action :authenticate_and_set_user
        before_action :set_point_history, only: [:show, :update, :destroy]
        load_and_authorize_resource

        # GET /point_histories
        def index
          @point_histories = PointHistory.all

          json_response(@point_histories)
        end

        # GET /point_histories/1
        def show
          json_response(@point_history)
        end

        # POST /point_histories
        def create
          @point_history = PointHistory.new(point_history_params)

          if @point_history.save
            json_response(@point_history, :created)
          else
            json_response_error(@point_history.errors)
          end
        end

        # PATCH/PUT /point_histories/1
        def update
          if @point_history.update(point_history_params)
            json_response(@point_history)
          else
            json_response_error(@point_history.errors)
          end
        end

        # DELETE /point_histories/1
        def destroy
          @point_history.destroy
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_point_history
            @point_history = PointHistory.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def point_history_params
            params.require(:point_history).permit(:user_id, :collect_id, :collector_id, :value)
          end
      end
    end
  end
end
