# frozen_string_literal: true

module Swagger
  class SystemModuleUser
    include ::Swagger::Blocks

    swagger_schema :SystemModuleUserDTO do
      property :id do
        key :type, :integer
        key :format, :int64
      end

      property :user_id do
        key :type, :integer
        key :format, :int64
      end

      property :system_module_id do
        key :type, :integer
        key :format, :int64
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

    swagger_schema :SystemModuleUserInput do
      property :user_id do
        key :type, :integer
        key :format, :int64
      end

      property :system_module_id do
        key :type, :integer
        key :format, :int64
      end
    end
  end
end
