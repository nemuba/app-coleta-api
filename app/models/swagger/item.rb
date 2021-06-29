module Swagger
  class Item
    include ::Swagger::Blocks

    swagger_schema :ItemDTO do
      property :id do
        key :type, :integer
      end

      property :point do
        key :type, :integer
      end

      property :name do
        key :type, :string
      end

      property :point_weight do
        key :type, :number
      end

      property :item_type_id do
        key :type, :integer
      end

      property :item_type do
        key :'$ref', :ItemTypeDTO
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

    swagger_schema :ItemInput do
      property :point do
        key :type, :integer
      end

      property :name do
        key :type, :string
      end

      property :point_weight do
        key :type, :number
      end

      property :item_type_id do
        key :type, :integer
      end
    end
  end
end
