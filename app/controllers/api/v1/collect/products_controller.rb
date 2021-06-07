module Api
  module V1
    module Collect
      class ProductsController < ApplicationController
        before_action :authenticate_and_set_user
        before_action :set_product, only: [:show, :update, :destroy]

        # GET /products
        def index
          @products = Product.all

          authorize! :read, @products

          json_response(@products)
        end

        # GET /products/1
        def show
          authorize! :read, @product

          json_response(@product)
        end

        # POST /products
        def create
          @product = current_user.products.build(product_params)

          authorize! :create, @product

          if @product.save
            json_response(@product, :created)
          else
            json_response_error(@product.errors)
          end
        end

        # PATCH/PUT /products/1
        def update
          authorize! :update, @product

          if @product.update(product_params)
            json_response(@product)
          else
            json_response_error(@product.errors)
          end
        end

        # DELETE /products/1
        def destroy
          authorize! :destroy, @product

          @product.destroy
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_product
            @product = Product.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def product_params
            params.require(:product).permit(:name, :price, :point)
          end
      end
    end
  end
end
