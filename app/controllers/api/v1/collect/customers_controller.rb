# frozen_string_literal: true

module Api
  module V1
    module Collect
      class CustomersController < ApplicationController
        before_action :authenticate_and_set_user
        before_action :set_customer, only: %i[show update destroy]
        load_and_authorize_resource

        INCLUDES = [
          "collects",
          "user_modules",
          "system_module_users",
          "profile",
          "profile.address",
          "user_point",
          "product_user_histories"
        ].freeze

        def index
          @customers = Customer.all

          json_response(@customers, :ok, include: INCLUDES, collection_serializer: CustomerSerializer)
        end

        def show
          json_response(@customer, :ok, include: INCLUDES)
        end

        def create
          user = Customer.new(customer_params)

          if user.save
            json_response(user)
          else
            json_response_error(user.errors)
          end
        end

        def update
          if @customer.update(customer_params)
            json_response(@customer)
          else
            json_response_error(@customer.errors)
          end
        end

        def destroy
          @customer.destroy
        end

        private
          def customer_params
            params.require(:customer).permit(
              :email,
              :password,
              :password_confirmation,
              :role,
              system_module_users_attributes: [:id, :user_id, :system_module_id, :_destroy],
              user_point_attributes: [:id, :value, :_destroy],
              profile_attributes: [
                :id,
                :user_id,
                :name,
                :email,
                :phone,
                :document,
                :_destroy,
                address_attributes: [
                  :id,
                  :profile_id,
                  :street,
                  :number,
                  :complement,
                  :neighborhood,
                  :city,
                  :state,
                  :country,
                  :zip_code,
                  :latitude,
                  :longitude,
                  :_destroy
                ]
              ],
              product_user_histories_attributes: [
                :id,
                :user_id,
                :user_points,
                :total_points,
                :product_id,
                :quantity,
                :_destroy
              ]
            )
          end

          def set_customer
            @customer = Customer.find(params[:id])
          end
      end
    end
  end
end
