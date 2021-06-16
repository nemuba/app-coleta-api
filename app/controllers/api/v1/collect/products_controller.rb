# frozen_string_literal: true

module Api
  module V1
    module Collect
      class ProductsController < ApplicationController
        before_action :authenticate_and_set_user
        before_action :set_product, only: [:show, :update, :destroy]
        load_and_authorize_resource

        # GET /products
        def index
          @products = Product.all

          json_response(@products)
        end

        # GET /products/1
        def show
          json_response(@product)
        end

        # POST /products
        def create
          @product = current_user.products.build(product_params)

          if @product.save
            json_response(@product, :created)
          else
            json_response_error(@product.errors)
          end
        end

        # PATCH/PUT /products/1
        def update
          if @product.update(product_params)
            json_response(@product)
          else
            json_response_error(@product.errors)
          end
        end

        # DELETE /products/1
        def destroy
          @product.destroy
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_product
            @product = Product.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def product_params
            params.require(:product).permit(:name, :price, :point, :user_id)
          end
      end
    end
  end
end

