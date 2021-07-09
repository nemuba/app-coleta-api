# frozen_string_literal: true

module Api
  module V1
    module Collect
      module Swagger
        class ItemsController
          include ::Swagger::Blocks

          swagger_path "/items/{id}" do
            operation :get do
              key :summary, "Busca Item por ID"
              key :description, "Retorna um item se o usuário tiver permissão de acesso"
              key :operationId, "findItemById"
              key :tags, [
                "Item"
              ]
              parameter do
                key :name, :id
                key :in, :path
                key :description, "ID da item"
                key :required, true
                key :type, :integer
                key :format, :int64
              end
              response 200 do
                key :description, "Item"
                schema do
                  key :'$ref', :ItemDTO
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

          swagger_path "/items" do
            operation :get do
              key :summary, "Retorna todas as items cadastrados no sistema"
              key :description, "Retorna todas as items se o usuário tiver permissão de acesso"
              key :operationId, "FindItems"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Item"
              ]

              response 200 do
                key :description, "Item"
                schema do
                  key :type, :array
                  items do
                    key :'$ref', :ItemDTO
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

          swagger_path "/items" do
            operation :post do
              key :summary, "Cadastra item no sistema"
              key :description, "Retorna o item cadastrado"
              key :operationId, "AddItem"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Item"
              ]
              parameter do
                key :name, :item
                key :in, :body
                key :description, "Dados de Item"
                key :required, true
                schema do
                  key :'$ref', :ItemInput
                end
              end

              response 200 do
                key :description, "Item"
                schema do
                  key :'$ref', :ItemDTO
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

          swagger_path "/items/{id}" do
            operation :put do
              key :summary, "Edita item no sistema"
              key :description, "Retorna o item atualizada"
              key :operationId, "UpdateItem"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Item"
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, "ID da item"
                key :required, true
              end

              parameter do
                key :name, :item
                key :in, :body
                key :description, "Dados de Item"
                key :required, true
                schema do
                  key :'$ref', :ItemInput
                end
              end

              response 200 do
                key :description, "Item"
                schema do
                  key :'$ref', :ItemDTO
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

          swagger_path "/items/{id}" do
            operation :delete do
              key :summary, "Exclui item no sistema"
              key :description, "Exclui um item"
              key :operationId, "DestroyItem"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Item"
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, "ID da item"
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
end
