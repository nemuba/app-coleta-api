# frozen_string_literal: true

module Api
  module V1
    class CurrentUsersController < ApplicationController
      before_action :authenticate_and_set_user

      def show
        render json: UserSerializer.new(current_user, include: ["profile", "profile.address"]).as_json
      end
    end
  end
end
