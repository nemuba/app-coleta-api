# frozen_string_literal: true

module Swagger
  class ErrorModel
    include Swagger::Blocks

    swagger_schema :ErrorModel do
      key :required, [:status, :error]
      property :status do
        key :type, :string
      end
      property :error do
        key :type, :string
      end
    end
  end
end
