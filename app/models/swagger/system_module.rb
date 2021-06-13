# frozen_string_literal: true

module Swagger
  class SystemModule
    include ::Swagger::Blocks

    swagger_schema :SystemModuleDTO do
      property :id do
        key :type, :integer
      end

      property :user_id do
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

    swagger_schema :SystemModuleInput do
      property :id do
        key :type, :integer
      end

      property :name do
        key :type, :string
      end

      property :user_id do
        key :type, :integer
      end
    end
  end
end
