# frozen_string_literal: true

module Swagger
  class Customer
    include ::Swagger::Blocks

    swagger_schema :CustomerDTO do
      property :id do
        key :type, :integer
      end

      property :email do
        key :type, :string
      end

      property :role do
        key :type, :string
      end

      property :profile do
        key :'$ref', :ProfileDTO
      end

      property :user_point do
        key :'$ref', :UserPointDTO
      end

      property :collects do
        key :type, :array
        items do
          key :'$ref', :CollectDTO
        end
      end

      property :product_user_histories do
        key :type, :array
        items do
          key :'$ref', :ProductUserHistoryDTO
        end
      end

      property :created_at do
        key :type, :string
        key :format, "date-time"
      end

      property :updated_at do
        key :type, :string
        key :format, "date-time"
      end
    end

    swagger_schema :CustomerInput do
      property :email do
        key :type, :string
      end

      property :password do
        key :type, :string
      end

      property :password_confirmation do
        key :type, :string
      end

      property :role do
        key :type, :string
        key :default, "customer"
      end

      property :profile_attributes do
        key :'$ref', :ProfileInput
      end

      property :user_point_attributes do
        key :'$ref', :UserPointInput
      end
    end
  end
end
