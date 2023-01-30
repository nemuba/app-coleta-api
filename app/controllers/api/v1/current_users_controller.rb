# frozen_string_literal: true

module Api
  module V1
    class CurrentUsersController < ApplicationController
      before_action :authenticate_and_set_user

      INCLUDES = [
        "routes",
        "collects",
        "products",
        "collects.collect_status",
        "user_modules",
        "profile",
        "profile.address",
        "user_point",
        "product_user_histories",
        "product_user_histories.product",
        "product_user_histories.user",
      ].freeze

      def show
        return json_response(user, :ok, include: INCLUDES, serializer: BussinessSerializer) if current_user.business?

        json_response(user, :ok, include: INCLUDES, serializer: UserSerializer)
      end

      private
        def user
          return Bussiness.find(current_user.id) if current_user.business?
          current_user
        end
    end
  end
end
