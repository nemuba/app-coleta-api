# frozen_string_literal: true

module Swagger
  class RouteCollect
    include ::Swagger::Blocks

    swagger_schema :RouteCollectDTO do
      property :id do
        key :type, :integer
        key :format, :int64
      end

      property :collect_id do
        key :type, :integer
        key :format, :int64
      end

      property :route_id do
        key :type, :integer
        key :format, :int64
      end

      property :order do
        key :type, :integer
      end

      property :collect do
        key :'$ref', :CollectDTO
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

    swagger_schema :RouteCollectInput do
      property :id do
        key :type, :integer
      end

      property :collect_id do
        key :type, :integer
      end

      property :order do
        key :type, :integer
      end

      property :_destroy do
        key :type, :integer
      end
    end
  end
end
