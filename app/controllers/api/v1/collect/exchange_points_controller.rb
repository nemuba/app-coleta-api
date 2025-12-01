# frozen_string_literal: true

module Api
  module V1
    module Collect
      class ExchangePointsController < ApplicationController
        before_action :authenticate_and_set_user
        before_action :set_customer, only: %i[create]
        before_action :set_product, only: %i[create]
        load_and_authorize_resource

        def create
          exchange_point = ExchangePoint.new(exchange_point_params)
          exchange_point.save!
          render json: exchange_point, status: :created
        end

        private
          def set_customer
            @customer = Customer.find(params[:customer_id])
          end

          def set_product
            @product = Product.find(params[:product_id])
          end

          def exchange_point_params
            params.require(:exchange_point).permit(
              :customer_id,
              :product_id,
              :quantity
            )
          end
      end
    end
  end
end
