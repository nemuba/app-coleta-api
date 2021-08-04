# frozen_string_literal: true

module Api
  module V1
    module Collect
      class UsersController < ApplicationController
        before_action :authenticate_and_set_user
        before_action :set_profile, only: %i[show update destroy]
        load_and_authorize_resource
        INCLUDES = [
          "routes",
          "collects",
          "user_modules",
          "profile",
          "profile.address"
        ].freeze

        def index
          @users = User.all

          json_response(@users, :ok, include: INCLUDES)
        end

        def show
          json_response(@user, :ok, include: INCLUDES)
        end

        def create
          user = User.new(user_params)

          if user.save
            json_response(user)
          else
            json_response_error(user.error)
          end
        end

        def update
          if @user.update(user_params)
            json_response(@user)
          else
            json_response_error(@user.error)
          end
        end

        def destroy
          @user.destroy
        end

        private
          def user_params
            params.require(:user).permit(
              :email,
              :password,
              :password_confirmation,
              :role,
              user_point_attributes: [:id, :value, :_destroy],
              profile_attributes: [:id, :name, :email, :phone, :document, :_destroy]
            )
          end

          def set_user
            @user = User.find(params[:id])
          end
      end
    end
  end
end
