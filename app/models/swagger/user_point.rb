# frozen_string_literal: true

module Swagger
  class UserPoint
    include ::Swagger::Blocks

    swagger_schema :UserPointDTO do
      property :id do
        key :type, :integer
      end

      property :user_id do
        key :type, :integer
      end

      property :value do
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

    swagger_schema :UserPointInput do
      property :id do
        key :type, :integer
      end

      property :value do
        key :type, :integer
      end

      property :_destroy do
        key :type, :string
      end
    end
  end
end
