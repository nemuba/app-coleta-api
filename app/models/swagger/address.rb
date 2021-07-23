# frozen_string_literal: true

module Swagger
  class Address
    include ::Swagger::Blocks

    swagger_schema :AddressDTO do
      property :id do
        key :type, :integer
        key :format, :int64
      end

      property :street do
        key :type, :string
      end

      property :number do
        key :type, :string
      end

      property :neighborhood do
        key :type, :string
      end

      property :city do
        key :type, :string
      end

      property :state do
        key :type, :string
      end

      property :country do
        key :type, :string
      end

      property :zip_code do
        key :type, :string
      end

      property :latitude do
        key :type, :number
      end

      property :longitude do
        key :type, :number
      end

      property :profile_id do
        key :type, :integer
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

    swagger_schema :AddressInput do
      property :id do
        key :type, :integer
        key :format, :int64
      end

      property :street do
        key :type, :string
      end

      property :number do
        key :type, :string
      end

      property :neighborhood do
        key :type, :string
      end

      property :city do
        key :type, :string
      end

      property :country do
        key :type, :string
      end

      property :zip_code do
        key :type, :string
      end

      property :latitude do
        key :type, :number
      end

      property :longitude do
        key :type, :number
      end

      property :profile_id do
        key :type, :integer
      end

      property :_destroy do
        key :type, :string
      end
    end
  end
end
