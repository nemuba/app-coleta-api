# frozen_string_literal: true

module Swagger
  class Product
    include ::Swagger::Blocks

    swagger_schema :ProductDTO do
      property :id do
        key :type, :integer
      end

      property :user_id do
        key :type, :integer
      end

      property :name do
        key :type, :string
      end

      property :price do
        key :type, :number
      end

      property :point do
        key :type, :number
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

    swagger_schema :ProductInput do
      property :id do
        key :type, :integer
      end

      property :user_id do
        key :type, :integer
      end

      property :name do
        key :type, :string
      end

      property :price do
        key :type, :number
      end

      property :point do
        key :type, :number
      end
    end
  end
end
