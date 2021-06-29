# frozen_string_literal: true

module Swagger
  class ItemCollect
    include ::Swagger::Blocks

    swagger_schema :ItemCollectDTO do
      property :id do
        key :type, :integer
      end

      property :item_id do
        key :type, :integer
      end

      property :collect_id do
        key :type, :integer
      end

      property :weight do
        key :type, :number
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

    swagger_schema :ItemCollectInput do
      property :id do
        key :type, :integer
      end

      property :collect_id do
        key :type, :integer
      end

      property :weight do
        key :type, :number
      end

      property :_destroy do
        key :type, :string
      end
    end
  end
end
