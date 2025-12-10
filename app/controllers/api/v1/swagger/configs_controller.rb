# frozen_string_literal: true

module Api
  module V1
    module Swagger
      class ConfigsController
        include ::Swagger::Blocks

        swagger_path "/api/v1/configs" do
          operation :get do
            key :summary, "Lista todas as configurações"
            key :description, "Retorna lista de configurações do sistema (requer autenticação de admin)"
            key :operationId, "listConfigs"
            key :produces, ["application/json"]
            key :tags, ["Configs"]

            parameter do
              key :name, "Authorization"
              key :in, :header
              key :required, true
              key :type, :string
              key :description, "Bearer {access_token}"
            end

            response 200 do
              key :description, "Lista de configurações"
              schema do
                key :type, :array
                items do
                  key :'$ref', :ConfigDTO
                end
              end
            end

            response 401 do
              key :description, "Não autorizado"
            end

            response 403 do
              key :description, "Acesso negado"
            end
          end

          operation :post do
            key :summary, "Cria uma nova configuração"
            key :operationId, "createConfig"
            key :produces, ["application/json"]
            key :tags, ["Configs"]

            parameter do
              key :name, "Authorization"
              key :in, :header
              key :required, true
              key :type, :string
            end

            parameter do
              key :name, :config
              key :in, :body
              key :required, true
              schema do
                key :'$ref', :ConfigInput
              end
            end

            response 201 do
              key :description, "Configuração criada"
              schema do
                key :'$ref', :ConfigDTO
              end
            end

            response 422 do
              key :description, "Erro de validação"
              schema do
                key :'$ref', :ErrorModel
              end
            end
          end
        end

        swagger_path "/api/v1/configs/{id}" do
          operation :get do
            key :summary, "Busca configuração por ID"
            key :operationId, "getConfig"
            key :produces, ["application/json"]
            key :tags, ["Configs"]

            parameter do
              key :name, "Authorization"
              key :in, :header
              key :required, true
              key :type, :string
            end

            parameter do
              key :name, :id
              key :in, :path
              key :required, true
              key :type, :integer
            end

            response 200 do
              key :description, "Configuração encontrada"
              schema do
                key :'$ref', :ConfigDTO
              end
            end

            response 404 do
              key :description, "Não encontrado"
            end
          end

          operation :put do
            key :summary, "Atualiza configuração"
            key :operationId, "updateConfig"
            key :tags, ["Configs"]

            parameter do
              key :name, "Authorization"
              key :in, :header
              key :required, true
              key :type, :string
            end

            parameter do
              key :name, :id
              key :in, :path
              key :required, true
              key :type, :integer
            end

            parameter do
              key :name, :config
              key :in, :body
              key :required, true
              schema do
                key :'$ref', :ConfigInput
              end
            end

            response 200 do
              key :description, "Configuração atualizada"
              schema do
                key :'$ref', :ConfigDTO
              end
            end
          end

          operation :delete do
            key :summary, "Remove configuração"
            key :operationId, "deleteConfig"
            key :tags, ["Configs"]

            parameter do
              key :name, "Authorization"
              key :in, :header
              key :required, true
              key :type, :string
            end

            parameter do
              key :name, :id
              key :in, :path
              key :required, true
              key :type, :integer
            end

            response 204 do
              key :description, "Configuração removida"
            end
          end
        end
      end
    end
  end
end
