module Swagger
  class CollectStatus
    include ::Swagger::Blocks

    swagger_schema :CollectStatusDTO do
      property :id do
        key :type, :integer
      end

      property :name do
        key :type, :string
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

    swagger_schema :CollectStatusInput do
      property :id do
        key :type, :integer
      end

      property :name do
        key :type, :string
      end

      property :_destroy do
        key :type, :string
      end
    end
  end
end
