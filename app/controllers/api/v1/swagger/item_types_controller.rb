# frozen_string_literal: true

module Api
  module V1
    module Swagger
      class ItemTypesController
        include ::Swagger::Blocks

        swagger_path "/itemtypes/{id}" do
          operation :get do
            key :summary, "Busca tipo do item por ID"
            key :description, "Retorna um tipo de item"
            key :operationId, "findItemTypeById"
            key :tags, [
              "Item Type"
            ]
            parameter do
              key :name, :id
              key :in, :path
              key :description, "ID do tipo do item"
              key :required, true
              key :type, :integer
              key :format, :int64
            end
            response 200 do
              key :description, "Tipo de item"
              schema do
                key :'$ref', :ItemTypeDTO
              end
            end
            response :default do
              key :description, "Error"
              schema do
                key :'$ref', :ErrorModel
              end
            end
          end
        end

        swagger_path "/itemtypes" do
          operation :get do
            key :summary, "Retorna todos tipos de itens"
            key :description, "Retorna todos tipos de itens"
            key :operationId, "FindItemType"
            key :produces, [
              "application/json",
              "text/html",
            ]
            key :tags, [
              "Item Type"
            ]

            response 200 do
              key :description, "Tipo de item"
              schema do
                key :type, :array
                items do
                  key :'$ref', :ItemTypeDTO
                end
              end
            end

            response :default do
              key :description, "Error"
              schema do
                key :'$ref', :ErrorModel
              end
            end
          end
        end

        swagger_path "/itemtypes" do
          operation :post do
            key :summary, "Cadastra tipo de item"
            key :description, "Retorna o tipo de item"
            key :operationId, "AddItemType"
            key :produces, [
              "application/json",
              "text/html",
            ]
            key :tags, [
              "Item Type"
            ]
            parameter do
              key :name, :item_type
              key :in, :body
              key :description, "Dados do Tipo de item"
              key :required, true
              schema do
                key :'$ref', :ItemTypeInput
              end
            end

            response 200 do
              key :description, "Tipo de item"
              schema do
                key :'$ref', :ItemTypeDTO
              end
            end
            response :default do
              key :description, "Error"
              schema do
                key :'$ref', :ErrorModel
              end
            end
          end
        end

        swagger_path "/itemtypes/{id}" do
          operation :put do
            key :summary, "Edita tipo de item"
            key :description, "Retorna o tipo do item"
            key :operationId, "UpdateItemType"
            key :produces, [
              "application/json",
              "text/html",
            ]
            key :tags, [
              "Item Type"
            ]

            parameter do
              key :name, :id
              key :type, :integer
              key :in, :path
              key :description, "ID do tipo do item"
              key :required, true
            end

            parameter do
              key :name, :item_type
              key :in, :body
              key :description, "Dados do tipo do item"
              key :required, true
              schema do
                key :'$ref', :ItemTypeInput
              end
            end

            response 200 do
              key :description, "Tipo de item"
              schema do
                key :'$ref', :ItemTypeDTO
              end
            end
            response :default do
              key :description, "Error"
              schema do
                key :'$ref', :ErrorModel
              end
            end
          end
        end

        swagger_path "/itemtypes/{id}" do
          operation :delete do
            key :summary, "Exclui tipo de item"
            key :description, "Exclui o tipo de item"
            key :operationId, "DestroyItemType"
            key :produces, [
              "application/json",
              "text/html",
            ]
            key :tags, [
              "Item Type"
            ]

            parameter do
              key :name, :id
              key :type, :integer
              key :in, :path
              key :description, "ID do tipo de item"
              key :required, true
            end

            response 204 do
              key :description, "not_content"
            end
            response :default do
              key :description, "Error"
              schema do
                key :'$ref', :ErrorModel
              end
            end
          end
        end
      end
    end
  end
end
