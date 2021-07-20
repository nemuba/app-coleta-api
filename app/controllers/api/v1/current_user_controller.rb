# frozen_string_literal: true

module Api
  module V1
    class CurrentUserController < ApplicationController
      before_action :authenticate_and_set_user
      load_and_authorize_resource

      def show
        render json: current_user
      end
    end
  end
end
