module Api
  module V1
    class GetLocationController < ApplicationController
      before_action :authenticate_and_set_user

      def create
        return render json: {
          status: "error",
          msg: [
            "Parâmetros inválidos! Parâmetros necessários: longitude, latitude"
          ]
        }, status: :unprocessable_entity unless params_valid?

        data = GetLocation.call(params[:latitude], params[:longitude])

        json_response(data)
      end

      private
        def params_valid?
          params[:latitude].present? && params[:longitude].present?
        end
    end
  end
end
