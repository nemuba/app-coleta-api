# frozen_string_literal: true

module Api
  module V1
    module Swagger
      class RecyclablesController
        include ::Swagger::Blocks

        swagger_path "/api/v1/recyclables" do
          operation :get do
            key :summary, "Lista todos os recicláveis"
            key :description, "Retorna lista de materiais recicláveis"
            key :operationId, "listRecyclables"
            key :produces, ["application/json"]
            key :tags, ["Recyclables"]

            response 200 do
              key :description, "Lista de recicláveis"
              schema do
                key :type, :array
                items do
                  key :'$ref', :RecyclableDTO
                end
              end
            end
          end

          operation :post do
            key :summary, "Cria um novo reciclável"
            key :description, "Adiciona um novo material reciclável"
            key :operationId, "createRecyclable"
            key :produces, ["application/json"]
            key :tags, ["Recyclables"]

            parameter do
              key :name, :recyclable
              key :in, :body
              key :required, true
              schema do
                key :'$ref', :RecyclableInput
              end
            end

            response 201 do
              key :description, "Reciclável criado"
              schema do
                key :'$ref', :RecyclableDTO
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

        swagger_path "/api/v1/recyclables/{id}" do
          operation :get do
            key :summary, "Busca reciclável por ID"
            key :operationId, "getRecyclable"
            key :produces, ["application/json"]
            key :tags, ["Recyclables"]

            parameter do
              key :name, :id
              key :in, :path
              key :required, true
              key :type, :integer
            end

            response 200 do
              key :description, "Reciclável encontrado"
              schema do
                key :'$ref', :RecyclableDTO
              end
            end

            response 404 do
              key :description, "Não encontrado"
            end
          end

          operation :put do
            key :summary, "Atualiza reciclável"
            key :operationId, "updateRecyclable"
            key :produces, ["application/json"]
            key :tags, ["Recyclables"]

            parameter do
              key :name, :id
              key :in, :path
              key :required, true
              key :type, :integer
            end

            parameter do
              key :name, :recyclable
              key :in, :body
              key :required, true
              schema do
                key :'$ref', :RecyclableInput
              end
            end

            response 200 do
              key :description, "Reciclável atualizado"
              schema do
                key :'$ref', :RecyclableDTO
              end
            end

            response 422 do
              key :description, "Erro de validação"
              schema do
                key :'$ref', :ErrorModel
              end
            end
          end

          operation :delete do
            key :summary, "Remove reciclável"
            key :operationId, "deleteRecyclable"
            key :tags, ["Recyclables"]

            parameter do
              key :name, :id
              key :in, :path
              key :required, true
              key :type, :integer
            end

            response 204 do
              key :description, "Reciclável removido"
            end
          end
        end
      end
    end
  end
end
