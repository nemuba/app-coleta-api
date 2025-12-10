# frozen_string_literal: true

module Swagger
  class ExchangePoint
    include ::Swagger::Blocks

    swagger_schema :ExchangePointInput do
      key :required, [:customer_id, :product_id, :quantity]

      property :customer_id do
        key :type, :integer
        key :description, "ID do cliente"
      end

      property :product_id do
        key :type, :integer
        key :description, "ID do produto"
      end

      property :quantity do
        key :type, :integer
        key :description, "Quantidade de produtos"
      end
    end

    swagger_schema :ExchangePointDTO do
      property :id do
        key :type, :integer
      end

      property :customer_id do
        key :type, :integer
      end

      property :product_id do
        key :type, :integer
      end

      property :quantity do
        key :type, :integer
      end

      property :created_at do
        key :type, :string
        key :format, "date-time"
      end
    end
  end
end
