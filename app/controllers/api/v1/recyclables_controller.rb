# frozen_string_literal: true

module Api
  module V1
    class RecyclablesController < ApplicationController
      before_action :set_recyclable, only: [:show, :update, :destroy]

      # GET /recyclables
      def index
        @recyclables = Recyclable.all

        json_response(@recyclables)
      end

      # GET /recyclables/1
      def show
        json_response(@recyclable)
      end

      # POST /recyclables
      def create
        @recyclable = Recyclable.new(recyclable_params)

        if @recyclable.save
          json_response(@recyclable, :created)
        else
          json_response_error(@recyclable.errors, :unprocessable_entity)
        end
      end

      # PATCH/PUT /recyclables/1
      def update
        if @recyclable.update(recyclable_params)
          json_response(@recyclable)
        else
          json_response_error(@recyclable.errors, :unprocessable_entity)
        end
      end

      # DELETE /recyclables/1
      def destroy
        @recyclable.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_recyclable
          @recyclable = Recyclable.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def recyclable_params
          params.require(:recyclable).permit(:name, :unit_of_measurement, :measure, :point)
        end
    end
  end
end
