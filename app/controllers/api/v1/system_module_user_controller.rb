# frozen_string_literal: true

# frozen_literal_string: true

module Api
  module V1
    class SystemModuleUserController < ApplicationController
      before_action :authenticate_and_set_user
      before_action :set_system_module_user, only: [:show, :update, :destroy]
      load_and_authorize_resource

      def index
        system_module_user = SystemModuleUser.all

        json_response(system_module_user)
      end

      def show
        json_response(@system_module_user)
      end

      def create
        system_module_user = SystemModuleUser.new(system_module_user_params)

        if system_module_user.save
          json_response(system_module_user)
        else
          json_response_error(system_module_user.errors)
        end
      end

      def update
        if @system_module_user.update(system_module_user_params)
          json_response(@system_module_user)
        else
          json_response_error(@system_module_user.errors)
        end
      end

      def destroy
        @system_module_user.destroy
      end

      def current_ability
        @current_ability = AdminAbility.new(current_user)
      end

      private
        def set_system_module_user
          @system_module_user = SystemModuleUser.find(params[:id])
        end

        def system_module_user_params
          params.require(:system_module_user).permit(:system_module_id, :user_id)
        end
    end
  end
end
