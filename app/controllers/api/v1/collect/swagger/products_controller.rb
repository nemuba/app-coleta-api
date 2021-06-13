# frozen_string_literal: true

module Api
  module V1
    module Collect
      module Swagger
        class ProductsController
          include ::Swagger::Blocks

          swagger_path "/products/{id}" do
            operation :get do
              key :summary, "Busca Produto por ID"
              key :description, "Retorna um produto se o usuário tiver permissão de acesso"
              key :operationId, "findProductById"
              key :tags, [
                "Product"
              ]
              parameter do
                key :name, :id
                key :in, :path
                key :description, "ID do produto"
                key :required, true
                key :type, :integer
                key :format, :int64
              end
              response 200 do
                key :description, "Produto"
                schema do
                  key :'$ref', :ProductDTO
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

          swagger_path "/products" do
            operation :get do
              key :summary, "Retorna todas os produtos cadastrados no sistema"
              key :description, "Retorna todas os produtos se o usuário tiver permissão de acesso"
              key :operationId, "FindProducts"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Product"
              ]

              response 200 do
                key :description, "Produto"
                schema do
                  key :type, :array
                  items do
                    key :'$ref', :ProductDTO
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

          swagger_path "/products" do
            operation :post do
              key :summary, "Cadastra produto no sistema"
              key :description, "Retorna o produto cadastrado"
              key :operationId, "AddProduct"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Product"
              ]
              parameter do
                key :name, :product
                key :in, :body
                key :description, "Dados do Produto"
                key :required, true
                schema do
                  key :'$ref', :ProductInput
                end
              end

              response 200 do
                key :description, "Produto"
                schema do
                  key :'$ref', :ProductDTO
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

          swagger_path "/products/{id}" do
            operation :put do
              key :summary, "Edita produto no sistema"
              key :description, "Retorna o produto atualizado"
              key :operationId, "UpdateProduct"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Product"
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, "ID do produto"
                key :required, true
              end

              parameter do
                key :name, :product
                key :in, :body
                key :description, "Dados do produto"
                key :required, true
                schema do
                  key :'$ref', :ProductInput
                end
              end

              response 200 do
                key :description, "Produto"
                schema do
                  key :'$ref', :ProductDTO
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

          swagger_path "/products/{id}" do
            operation :delete do
              key :summary, "Exclui produto no sistema"
              key :description, "Exclui o produto"
              key :operationId, "DestroyProduct"
              key :produces, [
                "application/json",
                "text/html",
              ]
              key :tags, [
                "Product"
              ]

              parameter do
                key :name, :id
                key :type, :integer
                key :in, :path
                key :description, "ID do produto"
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
