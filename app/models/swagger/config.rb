# frozen_string_literal: true

module Swagger
  class Config
    include ::Swagger::Blocks

    swagger_schema :ConfigDTO do
      property :id do
        key :type, :integer
      end

      property :param do
        key :type, :string
        key :description, "Nome do parâmetro de configuração"
      end

      property :value do
        key :type, :integer
        key :description, "Valor do parâmetro"
      end

      property :system_module_id do
        key :type, :integer
        key :description, "ID do módulo do sistema"
      end

      property :system_module do
        key :'$ref', :SystemModuleDTO
      end

      property :created_at do
        key :type, :string
        key :format, "date-time"
      end

      property :updated_at do
        key :type, :string
        key :format, "date-time"
      end
    end

    swagger_schema :ConfigInput do
      key :required, [:param, :value, :system_module_id]

      property :param do
        key :type, :string
      end

      property :value do
        key :type, :integer
      end

      property :system_module_id do
        key :type, :integer
      end
    end
  end
end
