# frozen_string_literal: true

module Api
  module V1
    class SystemModulesController < ApplicationController
      before_action :authenticate_and_set_user
      before_action :set_system_module, only: [:show, :update, :destroy]
      load_and_authorize_resource

      def index
        system_modules = SystemModule.all

        json_response(system_modules)
      end

      def show
        json_response(@system_module)
      end

      def create
        system_module = SystemModule.new(system_module_params)

        if system_module.save
          json_response(system_module)
        else
          json_response_error(system_module.errors)
        end
      end

      def update
        if @system_module.update(system_module_params)
          json_response(@system_module)
        else
          json_response_error(@system_module.errors)
        end
      end

      def destroy
        @system_module.destroy
      end

      def current_ability
        @current_ability = AdminAbility.new(current_user)
      end

      private
        def set_system_module
          @system_module = SystemModule.find(params[:id])
        end

        def system_module_params
          params.require(:system_module).permit(:name, :user_id)
        end
    end
  end
end
