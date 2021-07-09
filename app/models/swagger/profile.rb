# frozen_string_literal: true

module Swagger
  class Profile
    include ::Swagger::Blocks

    swagger_schema :ProfileDTO do
      property :id do
        key :type, :integer
      end

      property :user_id do
        key :type, :integer
      end

      property :name do
        key :type, :string
      end

      property :phone do
        key :type, :string
      end

      property :email do
        key :type, :string
      end

      property :document do
        key :type, :string
      end

      property :address do
        key :'$ref', :AddressDTO
      end

      property :created_at do
        key :type, :string
        key :format, "yyyy-MM-dd HH24:MI:SS.MS Z"
      end

      property :updated_at do
        key :type, :string
        key :format, "yyyy-MM-dd HH24:MI:SS.MS Z"
      end
    end

    swagger_schema :ProfileInput do
      property :id do
        key :type, :integer
      end

      property :user_id do
        key :type, :integer
      end

      property :name do
        key :type, :string
      end

      property :phone do
        key :type, :string
      end

      property :email do
        key :type, :string
      end

      property :document do
        key :type, :string
      end

      property :address_attributes do
        key :'$ref', :AddressInput
      end
    end
  end
end
