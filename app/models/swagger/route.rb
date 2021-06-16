# frozen_string_literal: true

module Swagger
  class Route
    include ::Swagger::Blocks

    swagger_schema :RouteDTO do
      property :id do
        key :type, :integer
        key :format, :int64
      end

      property :user_id do
        key :type, :integer
        key :format, :int64
      end

      property :date_collect do
        key :type, :string
      end

      property :date_start do
        key :type, :string
      end

      property :date_finish do
        key :type, :string
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

    swagger_schema :RouteInput do
      property :date_collect do
        key :type, :string
      end

      property :date_start do
        key :type, :string
      end

      property :date_finish do
        key :type, :string
      end
    end
  end
end
