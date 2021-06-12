module Swagger
  class Collect
    include ::Swagger::Blocks

    swagger_schema :CollectDTO do
      property :id do
        key :type, :integer
        key :format, :int64
      end

      property :note do
        key :type, :string
      end

      property :collect_status do
        key :'$ref', :CollectStatusDTO
      end

      property :created_at do
        key :type, :string
        key :format, 'yyyy-MM-dd HH24:MI:SS.MS Z'
      end

      property :updated_at do
        key :type, :string
        key :format, 'yyyy-MM-dd HH24:MI:SS.MS Z'
      end
    end

    swagger_schema :CollectInput do
      property :note do
        key :type, :string
      end

      property :collect_status_attributes do
        key :'$ref', :CollectStatusInput        
      end
    end
  end
end
