# frozen_string_literal: true

module Api
  module V1
    class CurrentUsersController < ApplicationController
      before_action :authenticate_and_set_user

      def show
        render json: current_user, serializer: UserSerializer
      end
    end
  end
end
