# frozen_string_literal: true

module Swagger
  class User
    include ::Swagger::Blocks

    swagger_schema :UserDTO do
      property :id do
        key :type, :integer
      end

      property :email do
        key :type, :integer
      end

      property :role do
        key :type, :string
      end

      property :profile do
        key :'$ref', :ProfileDTO
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

    swagger_schema :UserInput do
      property :id do
        key :type, :integer
      end

      property :email do
        key :type, :integer
      end

      property :password do
        key :type, :integer
      end

      property :password_confirmation do
        key :type, :integer
      end

      property :role do
        key :type, :string
      end

      property :user_point_attributes do
        key :'$ref', :UserPointInput
      end
    end
  end
end
