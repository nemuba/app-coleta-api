# frozen_string_literal: true

module Swagger
  class ItemType
    include ::Swagger::Blocks

    swagger_schema :ItemTypeDTO do
      property :id do
        key :type, :integer
      end

      property :name do
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

    swagger_schema :ItemTypeInput do
      property :id do
        key :type, :integer
      end

      property :name do
        key :type, :string
      end
    end
  end
end
