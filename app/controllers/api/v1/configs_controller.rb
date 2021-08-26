# frozen_string_literal: true

module Api
  module V1
    class ConfigsController < ApplicationController
      before_action :authenticate_and_set_user
      before_action :set_config, only: [:show, :update, :destroy]
      load_and_authorize_resource

      # GET /configs
      def index
        @configs = Config.all

        json_response(@configs)
      end

      # GET /configs/1
      def show
        json_response(@config)
      end

      # POST /configs
      def create
        @config = Config.new(config_params)

        if @config.save
          json_response(@config, :created)
        else
          json_response_error(@config.errors, :unprocessable_entity)
        end
      end

      # PATCH/PUT /configs/1
      def update
        if @config.update(config_params)
          json_response(@config)
        else
          json_response_error(@config.errors, :unprocessable_entity)
        end
      end

      # DELETE /configs/1
      def destroy
        @config.destroy
      end

      private
        def current_ability
          @current_ability = AdminAbility.new(current_user)
        end

        # Use callbacks to share common setup or constraints between actions.
        def set_config
          @config = Config.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def config_params
          params.require(:config).permit(:param, :value, :system_module_id)
        end
    end
  end
end
