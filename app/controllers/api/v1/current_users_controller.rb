# frozen_string_literal: true

module Api
  module V1
    class CurrentUsersController < ApplicationController
      before_action :authenticate_and_set_user

      INCLUDES = [
        "routes",
        "collects",
        "user_modules",
        "profile",
        "profile.address"
      ].freeze

      def show
        render json: current_user, serializer: UserSerializer, include: INCLUDES
      end
    end
  end
end
