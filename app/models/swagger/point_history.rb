# frozen_string_literal: true

module Swagger
  class PointHistory
    include ::Swagger::Blocks

    swagger_schema :PointHistoryDTO do
      property :id do
        key :type, :integer
        key :format, :int64
      end

      property :user_id do
        key :type, :integer
        key :format, :int64
      end

      property :collect_id do
        key :type, :integer
        key :format, :int64
      end

      property :collector_id do
        key :type, :integer
        key :format, :int64
      end

      property :value do
        key :type, :integer
      end

      property :user do
        key :'$ref', :UserDTO
      end

      property :collect do
        key :'$ref', :CollectDTO
      end

      property :collector do
        key :'$ref', :UserDTO
      end

      property :created_at do
        key :type, :string
        key :format, "dd/MM/yyyy HH:mm:ss"
      end

      property :updated_at do
        key :type, :string
        key :format, "dd/MM/yyyy HH:mm:ss"
      end
    end

    swagger_schema :PointHistoryInputDTO do
      property :user_id do
        key :type, :integer
        key :format, :int64
      end

      property :collector_id do
        key :type, :integer
        key :format, :int64
      end

      property :collect_id do
        key :type, :integer
        key :format, :int64
      end

      property :value do
        key :type, :integer
      end
    end
  end
end
